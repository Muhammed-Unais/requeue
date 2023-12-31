import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/signup/signup_formfield.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/utils/validation/signup_validation.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  ValueNotifier<bool> passwordVisibility = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: passwordVisibility,
      builder: (context, isVisible, _) {
        return SignupFormField(
          textInputType: TextInputType.visiblePassword,
          validator: AuthValidation.password,
          controller: widget.controller,
          obscureText: !passwordVisibility.value,
          labelText: "Password",
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                passwordVisibility.value = !passwordVisibility.value;
              },
              child: Icon(
                !isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColor.greyColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
