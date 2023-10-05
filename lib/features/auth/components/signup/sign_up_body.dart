import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/signup/agreement_and_submit_button.dart';
import 'package:requeue/features/auth/components/signup/password_form_field.dart';
import 'package:requeue/features/auth/components/signup/phonenumber_form_field.dart';
import 'package:requeue/features/auth/components/signup/signup_formfield.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/res/constants/ksize.dart';
import 'package:requeue/utils/validation/signup_validation.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key, required this.authViewmodelProvider});

  final AuthViewmodelProvider authViewmodelProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
        key: authViewmodelProvider.formKey,
          child: Column(
            children: [
              Ksize.ktwentyH,
              SignupFormField(
                textInputType: TextInputType.name,
                validator: AuthValidation.name,
                labelText: "Username",
                controller: authViewmodelProvider.userNameController,
              ),
              Ksize.ktwentyH,
              SignupFormField(
                textInputType: TextInputType.name,
                validator: AuthValidation.name,
                labelText: "Full Name",
                controller: authViewmodelProvider.nameController,
              ),
              Ksize.ktwentyH,
              SignupFormField(
                textInputType: TextInputType.emailAddress,
                validator: AuthValidation.email,
                labelText: "Email",
                controller: authViewmodelProvider.emailController,
              ),
              Ksize.ktwentyH,
              PhoneNumberFormField(
                controller: authViewmodelProvider.phoneController,
              ),
              Ksize.ktwentyH,
              PasswordFormField(
                controller: authViewmodelProvider.passwordController,
              ),
              Ksize.ktwentyH,
              const AgreementAndSubmitButton()
            ],
          ),
        ),
      ),
    );
  }
}
