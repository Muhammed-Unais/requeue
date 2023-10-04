import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/agreement_and_submit_button.dart';
import 'package:requeue/features/auth/components/password_form_field.dart';
import 'package:requeue/features/auth/components/phonenumber_form_field.dart';
import 'package:requeue/res/components/authformfield.dart';
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
            AuthFormField(labelText: "Username"),
            Ksize.ktwentyH,
            AuthFormField(labelText: "Full Name"),
            Ksize.ktwentyH,
            AuthFormField(labelText: "Email"),
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
