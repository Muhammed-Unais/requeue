import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/res/components/auth_buttons.dart';
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
                child: Consumer<AuthViewmodelProvider>(
                  builder: (context, provider, _) {
                    return AuthButton(
                      isLoading: provider.isSignup,
                      text: "Sign up",
                      onPressed: isCheck
                          ? () {
                              var isValid =
                                  provider.formKey.currentState!.validate();
                              if (!isValid ||
                                  provider.countryPhoneCode == null) {
                                return;
                              } else {
                                provider.signUpPostApi(context);
                              }
                            }
                          : null,
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
