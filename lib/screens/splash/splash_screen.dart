import 'package:big_cart_app/controllers/user.dart';
import 'package:big_cart_app/screens/splash/background_image.dart';
import 'package:big_cart_app/screens/splash/foreground.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:big_cart_app/routes/route.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserController _userController = UserController();

  @override
  void initState() {
    isLogin();
  }

  isLogin() async {
    String accessToken = await _userController.isLogin();
    print(accessToken);
    if (accessToken.isNotEmpty || accessToken != '') {
      navigateScreen(route.homeScreen);
    } else {
      navigateScreen(route.loginScreen);
    }
  }

  navigateScreen(String routeName) async {
    await Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => true));
  }

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
