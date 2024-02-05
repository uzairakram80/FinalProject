// ignore_for_file: file_names

import 'package:final_application/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:final_application/Routes/app_navigation.dart';
import 'package:final_application/Routes/app_navigation_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Center(
        child: GestureDetector(
          onTap: () {
            AppNavigation.navigateTo(routeName: AppNavRoutes.loginScreen);
            //print('Hi EveryOne');
          },
          child: Image.asset(
            'assets/icons/splashIcon.png',
            height: 28.h,
            width: 28.h,
          ),
        ),
      ),
    );
  }
}
