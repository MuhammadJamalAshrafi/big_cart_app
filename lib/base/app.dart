import 'package:flutter/material.dart';
import 'package:big_cart_app/routes/route.dart' as route;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: route.splashScreen,
        onGenerateRoute: route.controller);
  }
}
