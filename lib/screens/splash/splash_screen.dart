import 'package:big_cart_app/screens/splash/background_image.dart';
import 'package:big_cart_app/screens/splash/foreground.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Stack(
        children: const [BackgroundImage(), Foreground()],
      ),
    );
  }
}
