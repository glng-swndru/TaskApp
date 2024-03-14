package main

import (
	"mini_project_v1/config"
	"mini_project_v1/controllers"
	"mini_project_v1/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	// Database
	db := config.DatabaseConnection()
	db.AutoMigrate(&models.User{}, &models.Task{})
	config.CreateOwnerAccount(db)

	// Controller
	userController := controllers.UserController{DB: db}
	taskController := controllers.TaskController{DB: db}

	// Router
	router := gin.Default()
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, "Welcome to the jungle")
	})

	router.POST("/users/login", userController.Login)
	router.POST("/users", userController.CreateAccount)
	router.DELETE("/users/:id", userController.Delete)
	router.GET("/users/Employee", userController.GetEmployee)

	router.POST("/tasks", taskController.Create)
	router.DELETE("/tasks/:id", taskController.Delete)
	router.PATCH("/tasks/:id/submit", taskController.Submit)
	router.PATCH("/tasks/:id/reject", taskController.Reject)
	router.PATCH("/tasks/:id/fix", taskController.Fix)
	router.PATCH("/tasks/:id/approve", taskController.Approve)
	router.GET("/tasks/:id", taskController.FindById)
	router.GET("/tasks/review/asc", taskController.NeedToBeReview)
	router.GET("/tasks/progress/:userId", taskController.ProgressTasks)
	router.GET("/tasks/stat/:userId", taskController.Statistic)
	router.GET("/tasks/user/:userId/:status", taskController.FindByUserAndStatus)

	router.Static("/attachments", "./attachments")
	router.Run("192.168.106.42:8080")
}
