import 'package:big_cart_app/providers/cart_provider.dart';
import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:big_cart_app/routes/route.dart' as route;
import 'package:provider/provider.dart';

class ShippingInformationScreen extends StatelessWidget {
  final int id;
  const ShippingInformationScreen({Key? key, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: MediaQuery.of(context).size.height / 2 - 200),
      Image.asset(Assets.orderSuccessIcon),
      SizedBox(height: MediaQuery.of(context).size.height * 0.045),
      const Text("Congrats!",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff282828),
              fontSize: 24)),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Text(
        "Your Order #$id is \n Successfully Received",
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xffB1B1B1),
            fontSize: 16),
        textAlign: TextAlign.center,
      ),
      // SizedBox(height: MediaQuery.of(context).size.height * 0.30),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.only(left: 17, right: 17, bottom: 36),
        child: GestureDetector(
            onTap: () {
              cartProvider.cardEmpty();
              Navigator.pushNamed(context, route.homeScreen);
            },
            child: const AppButton(name: "Go to Home")),
      )
    ]));
  }
}
