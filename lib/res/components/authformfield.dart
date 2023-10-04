import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.prefixWidget,
    this.hintText,
    this.hintStyle,this.textInputType,
    this.obscureText =false,
  });

  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixWidget,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 13,
              fontFamily: "Inter",
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Color.fromRGBO(112, 112, 112, 1),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
        ),
      ),
    );
  }
}
