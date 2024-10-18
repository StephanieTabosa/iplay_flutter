import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'constants/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.transparent,
        scaffoldBackgroundColor: AppColors.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.secondary),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.secondary,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.secondary,
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
