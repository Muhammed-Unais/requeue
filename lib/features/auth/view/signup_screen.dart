import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/sign_up_body.dart';
import 'package:requeue/res/constants/app_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.primaryColor,
            size: 20,
          ),
        ),
        title: const Text(
          "Sign up",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Inter",
          ),
        ),
      ),
      body: const SignupBody(),
    );
  }
}
