import 'package:flutter/material.dart';
import 'package:requeue/res/constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.isLoading,
  });

  final String text;
  final void Function()? onPressed;
  final bool isLoading;

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
      child: isLoading
          ? const SizedBox(
              height: 12,
              width: 12,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Inter",
              ),
            ),
    );
  }
}
