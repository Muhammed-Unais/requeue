import 'package:flutter/material.dart';
import 'package:requeue/res/constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      disabledColor: const Color.fromRGBO(112, 112, 112, 1),
      color: AppColor.primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "Inter",
        ),
      ),
    );
  }
}