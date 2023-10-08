import 'package:flutter/material.dart';
import 'package:requeue/features/auth/view/login_screen.dart';
import 'package:requeue/features/auth/view/signup_screen.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/features/home/view/home_screen.dart';
import 'package:requeue/features/profile/view/profile_screen.dart';
import 'package:requeue/features/splash/splash_screen.dart';
import 'package:requeue/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic>? genericRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case RoutesNames.loginroute:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );
      case RoutesNames.siguproute:
        var authViewmodelProvider = settings.arguments as AuthViewmodelProvider;
        return MaterialPageRoute(
          builder: (context) {
            return SignupScreen(
              authViewmodelProvider: authViewmodelProvider,
            );
          },
        );
      case RoutesNames.homeroute:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case RoutesNames.profileRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const ProfileScreen();
          },
        );
      default:
        return null;
    }
  }
}
