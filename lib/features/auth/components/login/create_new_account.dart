import 'package:flutter/material.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: RichText(
        overflow: TextOverflow.clip,
        text: const TextSpan(
          text: "You dont't have an account yet! ",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontFamily: "Inter",
          ),
          children: [
            TextSpan(
              text: "Sign in",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
      ),
    );
  }
}