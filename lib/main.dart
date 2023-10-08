import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requeue/features/auth/view_model/auth_view_model.dart';
import 'package:requeue/features/home/view_model/restaurent_viewmodel_provider.dart';
import 'package:requeue/features/profile/view_model/profile_viewmodel_provider.dart';
import 'package:requeue/res/constants/app_colors.dart';
import 'package:requeue/utils/routes/routes.dart';
import 'package:requeue/utils/routes/routes_name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.primaryColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNames.splashRoute,
        onGenerateRoute: Routes.genericRoute,
      ),
    );
  }
}
