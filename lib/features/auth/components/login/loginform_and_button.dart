import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/login/login_formfield.dart';
import 'package:requeue/res/components/auth_buttons.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/res/constants/ksize.dart';

class LoginFormAndButton extends StatelessWidget {
  const LoginFormAndButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        height: size.height * 0.4,
        width: size.width,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.25),
                    Colors.white.withOpacity(0.15)
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
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
                  const LoginFormField(
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontFamily: "Inter",
                      color: AppColor.greyColor,
                    ),
                    hintText: "E-mail",
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColor.greyColor,
                      size: 24,
                    ),
                  ),
                  Ksize.ktwentyH,
                  const LoginFormField(
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontFamily: "Inter",
                      color: AppColor.greyColor,
                    ),
                    hintText: "Password",
                    prefixIcon: Icon(
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
                    width: size.width,
                    height: size.height * 0.06,
                    child: AuthButton(
                      text: "Login",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
