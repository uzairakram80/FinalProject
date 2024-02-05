import 'package:final_application/Utils/app_colors.dart';
import 'package:final_application/Utils/app_constants.dart';
import 'package:flutter/material.dart';

class LoginSuccessfull extends StatelessWidget {
  const LoginSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LOGIN SUCESSful',
          style: TextStyle(fontFamily: AppConstants.textFont),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      backgroundColor: AppColors.scaffoldColor,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'LOGIN IS SUCCESSFULL !!!',
            style: TextStyle(fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
