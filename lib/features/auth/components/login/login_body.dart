import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/login/create_new_account.dart';
import 'package:requeue/features/auth/components/login/loginform_and_button.dart';
import 'package:requeue/features/auth/components/login/logo_and_skip_button.dart';
import 'package:requeue/features/auth/components/login/social_media_login.dart';
import 'package:requeue/res/constants/ksize.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Ksize.ktwentyH,
        LogoAndSkipButton(),
        Ksize.ktwentyH,
        LoginFormAndButton(),
        Ksize.ktwentyH,
        CreateNewAccount(),
        Ksize.ktwenty5H,
        SocialMediaLogin(),
      ],
    );
  }
}
