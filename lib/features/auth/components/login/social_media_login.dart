import 'package:flutter/material.dart';
import 'package:requeue/res/components/social_media_logo.dart';
import 'package:requeue/res/constants/ksize.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Flexible(
                child: Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              Ksize.ktenW,
              Text(
                "login with",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "Inter",
                ),
              ),
              Ksize.ktenW,
              Flexible(
                child: Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Ksize.ktwenty5H,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialMediaLogo(
                  image: "assets/images/Continue with google_button.png"),
              SocialMediaLogo(
                  image: "assets/images/Icon awesome-apple.png"),
              SocialMediaLogo(image: "assets/images/Facebook Logo.png"),
              SocialMediaLogo(
                  image: "assets/images/Icon awesome-twitter.png")
            ],
          ),
        )
      ],
    );
  }
}