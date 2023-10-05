import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.hintStyle,
  });

  final Widget? prefixIcon;
  final String? hintText;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}