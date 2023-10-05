import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/login/formfields_and_button.dart';

class LoginFormContainer extends StatelessWidget {
  const LoginFormContainer({
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
            FormFieldsAndButton(size: size)
          ],
        ),
      ),
    );
  }
}
