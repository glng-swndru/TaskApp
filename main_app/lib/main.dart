import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_app/common/app_color.dart';
import 'package:main_app/common/app_route.dart';
import 'package:main_app/data/models/users.dart';
import 'package:main_app/presentation/bloc/login/login_cubit.dart';
import 'package:main_app/presentation/bloc/user/user_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:d_session/d_session.dart';
import 'package:main_app/presentation/pages/add_employee_page.dart';
import 'package:main_app/presentation/pages/home_admin_page.dart';
import 'package:main_app/presentation/pages/login_page.dart';
import 'package:main_app/presentation/pages/profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true).copyWith(
          primaryColor: AppColor.primary,
          colorScheme: ColorScheme.light(
            primary: AppColor.primary,
            secondary: AppColor.secondary,
          ),
          scaffoldBackgroundColor: AppColor.scaffold,
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(
            surfaceTintColor: AppColor.primary,
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          popupMenuTheme: const PopupMenuThemeData(
            color: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          dialogTheme: const DialogTheme(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
          )
        ),
        initialRoute: AppRoute.home,
        routes: {
          AppRoute.home: (context) {
            return FutureBuilder(
              future: DSession.getUser(), 
              builder: (context, snapshot) {
                if (snapshot.data == null) return const LoginPage();
                User user = User.fromJson(Map.from(snapshot.data!));
                context.read<UserCubit>().update(user);
                if (user.role == "Admin") return const HomeAdminPage();
                return const Scaffold(); //home employee
              }
            );
          },
          AppRoute.addEmployee: (context) => const AddEmployeePage(),
          AppRoute.addTask: (context) => const Scaffold(),
          AppRoute.detailTask: (context) => const Scaffold(),
          AppRoute.listTask: (context) => const Scaffold(),
          AppRoute.login: (context) => const LoginPage(),
          AppRoute.monitorEmployee: (context) => const Scaffold(),
          AppRoute.profile: (context) => const ProfilePage(),
        },
      ),
    );
  }
}
