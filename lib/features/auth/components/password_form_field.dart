import 'package:flutter/material.dart';
import 'package:requeue/res/components/authformfield.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  ValueNotifier<bool> passwordVisibility = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: passwordVisibility,
      builder: (context,isVisible,_) {
        return AuthFormField(
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
                color: const Color.fromRGBO(185, 186, 200, 1),
              ),
            ),
          ),
        );
      }
    );
  }
}