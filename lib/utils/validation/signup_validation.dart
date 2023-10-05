import 'package:email_validator/email_validator.dart';

class AuthValidation {
  static String? password(String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Password can not be empty";
    } else if (value.length < 8) {
      return "Password Too short";
    } else if (!regExp.hasMatch(value)) {
      return "Enter a strong Password";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Email";
    }
    final email = value;
    final isValid = EmailValidator.validate(email);
    if (!isValid) {
      return "Enter Valid Email";
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can not be empty";
    }
    const pattern = r'^(?=.*?[a-z])';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return "Enter valid name";
    }

    return null;
  }

  static String? phoneNumber(String? value) {
    RegExp phoneNumber = RegExp(
      r'^\d{6,14}$',
    );
    if (value == null || value.isEmpty) {
      return "Phonenumber can not be empty";
    }
    if (!phoneNumber.hasMatch(value)) {
      return "Enter correct phone number";
    }
    return null;
  }
}
