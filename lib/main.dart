import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/view/login_screen.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/features/home/view/home_screen.dart';
import 'package:requeue/features/home/view_model/restaurent_viewmodel_provider.dart';
import 'package:requeue/features/profile/view_model/profile_viewmodel_provider.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/utils/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AuthViewmodelProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return RestaurantViewModelProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProfileViewModelProvider();
          },
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: context.read<AuthViewmodelProvider>().getJwtToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return const LoginScreen();
          } else {
            return const HomeScreen();
          }
        },
      ),
      onGenerateRoute: Routes.genericRoute,
    );
  }
}
