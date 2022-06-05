import 'package:big_cart_app/screens/login/background.dart';
import 'package:big_cart_app/screens/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Stack(children: [Backgrund(), LoginForm()])
        ]));
  }
}
