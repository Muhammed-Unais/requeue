import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:requeue/features/auth/components/signup/signup_formfield.dart';
import 'package:requeue/res/constants/app_colors.dart';

class PhoneNumberFormField extends StatefulWidget {
  const PhoneNumberFormField({
    super.key,
  });

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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignupFormField(
      textInputType: TextInputType.number,
      labelText: "phone",
      prefixWidget: Padding(
        padding: const EdgeInsets.only(left: 16,right: 10),
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
                  color:AppColor.greyColor,
                ),
              ),
            ),
            const SizedBox(width: 16,),
            const ColoredBox(
              color:AppColor.greyColor,
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
        color:AppColor.greyColor,
      ),
    );
  }
}
