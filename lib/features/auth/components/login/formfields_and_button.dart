import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/components/login/login_formfield.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/res/components/auth_buttons.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/res/constants/ksize.dart';
import 'package:requeue/utils/validation/signup_validation.dart';

class FormFieldsAndButton extends StatefulWidget {
  const FormFieldsAndButton({super.key, required this.size});

  final Size size;

  @override
  State<FormFieldsAndButton> createState() => _FormFieldsAndButtonState();
}

class _FormFieldsAndButtonState extends State<FormFieldsAndButton> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Login your account",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Inter",
                    color: Colors.white,
                  ),
                ),
              ),
              Ksize.ktwentyH,
              LoginFormField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                validator: AuthValidation.phoneNumber,
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Inter",
                  color: AppColor.greyColor,
                ),
                hintText: "Phone number",
                prefixIcon: const Icon(
                  Icons.person,
                  color: AppColor.greyColor,
                  size: 24,
                ),
              ),
              Ksize.ktwentyH,
              LoginFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                validator: AuthValidation.password,
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Inter",
                  color: AppColor.greyColor,
                ),
                hintText: "Password",
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: AppColor.greyColor,
                  size: 24,
                ),
              ),
              Ksize.ktwenty5H,
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Forget your password?",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Inter",
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
              Ksize.ktwenty5H,
              SizedBox(
                width: widget.size.width,
                height: widget.size.height * 0.06,
                child: AuthButton(
                  text: "Login",
                  onPressed: () {
                    log("Called1");
                    var isValid = _formkey.currentState!.validate();

                    if (!isValid) {
                    log("Called2");

                      return;
                    } else {
                    log("Called3");

                      Map<String, dynamic> userData = {
                        "phone_number": int.parse(phoneController.text),
                        "password": passwordController.text
                      };
                      context
                          .read<AuthViewmodelProvider>()
                          .loginApi(userData, context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
