import 'package:flutter/material.dart';
import 'package:requeue/res/constants/app_colors.dart';

class AgreementAndSubmitButton extends StatefulWidget {
  const AgreementAndSubmitButton({
    super.key,
  });

  @override
  State<AgreementAndSubmitButton> createState() =>
      _AgreementAndSubmitButtonState();
}

class _AgreementAndSubmitButtonState extends State<AgreementAndSubmitButton> {
  ValueNotifier<bool> agreementcheckBox = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            ValueListenableBuilder(
              valueListenable: agreementcheckBox,
              builder: (context, isCheck, _) {
                return Checkbox(
                  side: const BorderSide(
                    width: 1,
                    color: Color.fromRGBO(112, 112, 112, 1),
                    style: BorderStyle.solid,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  value: isCheck,
                  onChanged: (value) {
                    agreementcheckBox.value = !agreementcheckBox.value;
                  },
                );
              },
            ),
            SizedBox(
              width: size.width * 0.6,
              child: RichText(
                overflow: TextOverflow.clip,
                text: const TextSpan(
                  text: "I agree with the company's ",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontFamily: "Inter",
                  ),
                  children: [
                    TextSpan(
                      text: "privacy policy and terms of service",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColor.primaryColor,
                        decoration: TextDecoration.underline,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.08,
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.06,
          child: ValueListenableBuilder(
            valueListenable: agreementcheckBox,
            builder: (context, isCheck, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledColor: const Color.fromRGBO(112, 112, 112, 1),
                  color: AppColor.primaryColor,
                  onPressed: isCheck ? () {
                    
                  } : null,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
