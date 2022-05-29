// Route Names
import 'package:big_cart_app/screens/home/home_screen.dart';
import 'package:big_cart_app/screens/login/login_screen.dart';
import 'package:big_cart_app/screens/signup/signup_screen.dart';
import 'package:big_cart_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

const String loginScreen = 'login';
const String homeScreen = 'home';
const String splashScreen = 'splash';
const String signupScreen = 'signup';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginScreen:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case signupScreen:
      return MaterialPageRoute(builder: (context) => const SignupScreen());
    default:
      throw ('This route name does not exit');
  }
}
