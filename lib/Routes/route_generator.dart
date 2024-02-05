import 'package:final_application/Routes/app_navigation_routes.dart';
import 'package:final_application/Screens/login_screen.dart';
import 'package:final_application/Screens/login_successfull_screen.dart';
import 'package:final_application/Screens/splashScreen.dart';
import 'package:flutter/material.dart';
// import 'package:final_application/Screen/FirstNetworkCall/first_network_call.dart';
// import 'package:final_application/Screen/Login/login_screen.dart';
// import 'package:final_application/Screen/RandomUserScreen/random_users_screen.dart';
// import 'package:final_application/Screen/Users/user_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case AppNavRoutes.initialRoute:
        return routeScreen(child: const SplashScreen());

      case AppNavRoutes.loginScreen:
        return routeScreen(child: const loginScreen());

      case AppNavRoutes.loginSuccess:
        return routeScreen(child: const LoginSuccessfull());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Text('Error Page');
    });
  }

  static Route<dynamic> routeScreen({
    Widget? child,
  }) {
    return MaterialPageRoute(
      // builder: (context) => child!,
      builder: (context) => SafeArea(
        child: child!,
      ),
    );
  }
}
