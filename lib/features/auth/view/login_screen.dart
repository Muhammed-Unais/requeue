import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/login/login_body.dart';
import 'package:requeue/res/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff7f5bff),
                Color(0xff5bc1e0),
              ],
              stops: [0, 1],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child:const LoginBody(),
        ),
      ),
    );
  }
}


