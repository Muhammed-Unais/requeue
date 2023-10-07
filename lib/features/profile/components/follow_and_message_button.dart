import 'package:flutter/material.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/res/constants/ksize.dart';

class FollowAndMessageButton extends StatelessWidget {
  const FollowAndMessageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 216,
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Text(
              "Follow",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                color: Colors.white,
              ),
            ),
          ),
        ),
        Ksize.ktenW,
        Flexible(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 86 ,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(92, 194, 224, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Text(
              "Message",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}