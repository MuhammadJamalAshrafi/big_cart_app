import 'package:big_cart_app/screens/signup/background.dart';
import 'package:big_cart_app/screens/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        body: Column(children: [
      Stack(children: [const Background(), SignupForm()])
    ]));
  }
}
