import 'package:flutter/material.dart';

class SocialMediaLogo extends StatelessWidget {
  const SocialMediaLogo({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Image.asset(image),
    );
  }
}