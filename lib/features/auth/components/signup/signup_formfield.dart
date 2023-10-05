import 'package:flutter/material.dart';

class SignupFormField extends StatelessWidget {
  const SignupFormField({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.prefixWidget,
    this.hintText,
    this.hintStyle,this.textInputType,
    this.obscureText =false, this.controller, this.validator,
  });

  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? textInputType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
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
