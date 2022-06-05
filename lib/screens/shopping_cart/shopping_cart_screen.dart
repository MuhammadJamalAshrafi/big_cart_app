import 'package:big_cart_app/providers/cart_provider.dart';
import 'package:big_cart_app/screens/shopping_cart/cart_item.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:big_cart_app/widgets/app_button.dart';
import 'package:big_cart_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:big_cart_app/routes/route.dart' as route;

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);
    double shippingCharges = 1.5;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF4F5F9),
        body: Column(children: [
          const CustomAppBar(name: "Shopping Cart", issuffixIcon: false),
          const CartItem(),
          const Spacer(),
          Container(
            color: Colors.white,
            // height: 234,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 22, bottom: 26, left: 17, right: 17),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Subtotal", style: paragraph6),
                      const Spacer(),
                      Text("\$${cartProvider.getTotalPrices().toString()}",
                          style: paragraph6)
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Text("Shipping charges", style: paragraph6),
                      const Spacer(),
                      Text("\$$shippingCharges", style: paragraph6)
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1,
                    color: Color(0xFF868889),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Total", style: paragraph5),
                      const Spacer(),
                      Text(
                          (cartProvider.getTotalPrices() > 0)
                              ? "\$${shippingCharges + cartProvider.getTotalPrices()}"
                              : "\$0.0",
                          style: paragraph5)
                    ],
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    child: const AppButton(name: "Checkout"),
                    onTap: () {
                      Navigator.pushNamed(context, route.checkoutScreen);
                    },
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
