import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Route names (cleaner)
  static const String loginRoute = "/login";
  static const String signupRoute = "/signup";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Auth UI",

      // Simple Theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Start from login screen
      initialRoute: loginRoute,

      // Routes
      routes: {
        loginRoute: (context) => const LoginScreen(),
        signupRoute: (context) => const SignUpScreen(),
      },
    );
  }
}
