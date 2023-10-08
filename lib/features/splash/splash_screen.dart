import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> isUserValid() async {
    var authViewmodelProvider = context.read<AuthViewmodelProvider>();
    await authViewmodelProvider.getJwtToken().then((value) {
      authViewmodelProvider.getClientId().then((value) {
        log(value.toString());
      });
      if (value == null || value.isEmpty) {
        Navigator.pushReplacementNamed(context, RoutesNames.loginroute);
      } else {
        Navigator.pushReplacementNamed(context, RoutesNames.homeroute);
      }
    });
  }

  @override
  void initState() {
    isUserValid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              color: AppColor.primaryColor,
              height: 100,
              width: 100,
              "assets/images/rq-logo-OMAR-WHITE.png",
            ),
          ),
        ],
      ),
    );
  }
}
