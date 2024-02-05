import 'package:final_application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:final_application/Routes/app_navigation.dart';
import 'package:final_application/Routes/app_navigation_routes.dart';
import 'package:final_application/Routes/route_generator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Groceries',
        theme: ThemeData(),
        navigatorKey: AppNavigation.navigationKey,
        initialRoute: AppNavRoutes.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      );
    });
  }
}
