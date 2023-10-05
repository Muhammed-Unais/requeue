import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/signup/sign_up_body.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/res/constants/app_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, required this.authViewmodelProvider});

  final AuthViewmodelProvider authViewmodelProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.primaryColor,
              size: 20,
            ),
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
      body: SignupBody(authViewmodelProvider: authViewmodelProvider),
    );
  }
}
