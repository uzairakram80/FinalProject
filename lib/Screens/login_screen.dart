// ignore_for_file: unnecessary_string_interpolations, avoid_print
import 'package:final_application/Utils/app_colors.dart';
import 'package:final_application/Utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:final_application/Components/CustomTextFormField/custom_text_form_field.dart';
import 'package:final_application/Routes/app_navigation.dart';
import 'package:final_application/Routes/app_navigation_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String error = '';
  final FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'LOGIN SCREEN',
          style: TextStyle(
              color: AppColors.whiteBackgroundColor,
              fontFamily: AppConstants.textFont),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  textCapitalization: TextCapitalization.none,
                  heading: 'Username',
                  hintText: 'RandomUser@123',
                  controller: usernameController,
                  validator: (value) {
                    if (value!.length < 5) {
                      return 'Please enter minimum 5 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                Gap(2.h),
                CustomTextFormField(
                  textCapitalization: TextCapitalization.none,
                  heading: 'Password',
                  hintText: '*****',
                  maxLines: 1,
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Please enter at least 8 characters';
                    }
                    return null;
                  },
                ),
                Gap(2.h),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await auth.createUserWithEmailAndPassword(
                          email: usernameController.text.toString(),
                          password: passwordController.text.toString(),
                        );
                        // ignore: use_build_context_synchronously
                        AppNavigation.navigateTo(
                            routeName: AppNavRoutes.loginSuccess);
                      } on FirebaseAuthException catch (e) {
                        print('Error $e');
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
                if (error != '') Text('$error'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
