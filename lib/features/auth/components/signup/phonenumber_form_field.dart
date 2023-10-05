import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/components/signup/signup_formfield.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/utils/validation/signup_validation.dart';

class PhoneNumberFormField extends StatefulWidget {
  const PhoneNumberFormField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  State<PhoneNumberFormField> createState() => _PhoneNumberFormFieldState();
}

class _PhoneNumberFormFieldState extends State<PhoneNumberFormField> {
  String? phoneCode;

  void showCountryCode() {
    showCountryPicker(
      context: context,
      onSelect: (value) {
        setState(() {});
        phoneCode = value.phoneCode;
        context.read<AuthViewmodelProvider>().countryPhoneCode = phoneCode;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignupFormField(
      validator: SignupValidation.phoneNumber,
      controller: widget.controller,
      textInputType: TextInputType.number,
      labelText: "phone",
      prefixWidget: Padding(
        padding: const EdgeInsets.only(left: 16, right: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                showCountryCode();
              },
              child: Text(
                "+${phoneCode ?? 1}",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColor.greyColor,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const ColoredBox(
              color: AppColor.greyColor,
              child: SizedBox(
                width: 1,
                height: 24,
              ),
            )
          ],
        ),
      ),
      hintText: "Phone Number",
      hintStyle: const TextStyle(
        fontSize: 13,
        color: AppColor.greyColor,
      ),
    );
  }
}
