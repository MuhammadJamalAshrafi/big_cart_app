import 'package:big_cart_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:big_cart_app/routes/route.dart' as route;
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
        builder: (ctx, _) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route.homeScreen,
            onGenerateRoute: route.controller));
  }
}
