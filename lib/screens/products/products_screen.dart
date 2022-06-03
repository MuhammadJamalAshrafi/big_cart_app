import 'package:big_cart_app/screens/products/products.dart';
import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductsScreen extends StatelessWidget {
  final String name;
  final String id;
  const ProductsScreen({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
        backgroundColor: const Color(0xFFF4F5F9),
        body: Column(children: [
          CustomAppBar(
            name: name,
            issuffixIcon: true,
            suffixIcon: Assets.filterBlack,
          ),
          Products(catId: int.parse(id))
        ]));
  }
}
