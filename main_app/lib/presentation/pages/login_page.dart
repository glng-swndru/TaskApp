import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:main_app/common/app_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final edtEmail = TextEditingController();
    final edtPassword = TextEditingController();
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          buildHeader(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                DInput(
                  controller: edtEmail, 
                  fillColor: Colors.white,
                  radius: BorderRadius.circular(12),
                  hint: 'email',
                  ),
                  const SizedBox(height: 20),
                  DInputPassword(
                  controller: edtPassword, 
                  fillColor: Colors.white,
                  radius: BorderRadius.circular(12),
                  hint: 'password',
                  ),
                  const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AspectRatio buildHeader() {
    return AspectRatio(
          aspectRatio: 0.8,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                bottom: 80,
                child: Image.asset(
                  'assets/login_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                top: 200,
                bottom: 80,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColor.scaffold,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(width: 20),
                    RichText(
                        text: TextSpan(
                            text: 'Monitoring\n',
                            style: TextStyle(
                              color: AppColor.defaultText,
                              fontSize: 30,
                              height: 1.4,
                            ),
                            children: const [
                          TextSpan(text: 'with '),
                          TextSpan(
                              text: 'TaskApp ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ]))
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
