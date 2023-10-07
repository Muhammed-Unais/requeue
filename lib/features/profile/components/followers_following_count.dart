import 'package:flutter/material.dart';
import 'package:requeue/res/constants/ksize.dart';

class FollowersFollowingCount extends StatelessWidget {
  const FollowersFollowingCount({
    super.key, required this.follwers, required this.following,
  });

  final int? follwers;
  final int? following;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text(
              "Followers",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "Inter",
                color: Colors.black,
              ),
            ),
            Text(
              follwers ==null ?"0":follwers.toString(),
              style: const TextStyle(
                fontSize: 13,
                fontFamily: "Inter",
                color: Colors.black,
              ),
            ),
          ],
        ),
        Ksize.ktwentyW,
         Column(
          children: [
            const Text(
              "Following",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "Inter",
                color: Colors.black,
              ),
            ),
            Text(
              following ==null ?"0":following.toString(),
              style: const TextStyle(
                fontSize: 13,
                fontFamily: "Inter",
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
