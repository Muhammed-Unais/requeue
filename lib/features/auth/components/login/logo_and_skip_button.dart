import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:requeue/utils/routes/routes_name.dart';

class LogoAndSkipButton extends StatelessWidget {
  const LogoAndSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: Image.asset(
              "assets/images/rq-logo-OMAR-WHITE.png",
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 10,
          child: TextButton(
            onPressed: () {
              log("worked");
              Navigator.pushReplacementNamed(
                context,
                RoutesNames.homeroute,
              );
            },
            child: const Row(
              children: [
                Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Inter",
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
