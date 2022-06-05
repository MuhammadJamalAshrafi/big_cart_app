// Route Names

import 'package:big_cart_app/screens/checkout/checkout_screen.dart';
import 'package:big_cart_app/screens/home/home_screen.dart';
import 'package:big_cart_app/screens/login/login_screen.dart';
import 'package:big_cart_app/screens/products/products_screen.dart';
import 'package:big_cart_app/screens/shipping_information/shipping_information_screen.dart';
import 'package:big_cart_app/screens/shopping_cart/shopping_cart_screen.dart';
import 'package:big_cart_app/screens/signup/signup_screen.dart';
import 'package:big_cart_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

const String loginScreen = 'login';
const String homeScreen = 'home';
const String splashScreen = 'splash';
const String signupScreen = 'signup';
const String productsScreen = 'products';
const String shoppingCartScreen = 'shoppingCart';
const String checkoutScreen = 'checkout';
const String shippingInformationScreen = 'shippingInformation';

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
    case productsScreen:
      final arg = settings.arguments as Map;
      return MaterialPageRoute(
          builder: (context) =>
              ProductsScreen(name: arg['name'], id: arg['id']));
    case shoppingCartScreen:
      return MaterialPageRoute(
          builder: (context) => const ShoppingCartScreen());
    case checkoutScreen:
      return MaterialPageRoute(builder: (context) => CheckoutScreen());
    case shippingInformationScreen:
      return MaterialPageRoute(
          builder: (context) => const ShippingInformationScreen());

    default:
      throw ('This route name does not exit');
  }
}
