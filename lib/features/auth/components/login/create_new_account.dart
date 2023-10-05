import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/utils/routes/routes_name.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          var authViewProvider = context.read<AuthViewmodelProvider>();
          Navigator.pushNamed(context, RoutesNames.siguproute,
              arguments: authViewProvider);
        },
        child: RichText(
          overflow: TextOverflow.clip,
          text: const TextSpan(
            text: "You dont't have an account yet ! ",
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
      ),
    );
  }
}
