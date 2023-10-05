import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/signup/agreement_and_submit_button.dart';
import 'package:requeue/features/auth/components/signup/password_form_field.dart';
import 'package:requeue/features/auth/components/signup/phonenumber_form_field.dart';
import 'package:requeue/features/auth/components/signup/signup_formfield.dart';
import 'package:requeue/res/constants/ksize.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Ksize.ktwentyH,
            SignupFormField(labelText: "Username"),
            Ksize.ktwentyH,
            SignupFormField(labelText: "Full Name"),
            Ksize.ktwentyH,
            SignupFormField(labelText: "Email"),
            Ksize.ktwentyH,
            PhoneNumberFormField(),
            Ksize.ktwentyH,
            PasswordFormField(),
            Ksize.ktwentyH,
            AgreementAndSubmitButton()
          ],
        ),
      ),
    );
  }
}
