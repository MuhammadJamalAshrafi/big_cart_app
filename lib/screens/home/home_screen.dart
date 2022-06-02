import 'package:big_cart_app/screens/home/categories.dart';
import 'package:big_cart_app/screens/home/home_appbar.dart';
import 'package:big_cart_app/screens/home/carousel_slider.dart';
import 'package:big_cart_app/screens/home/products.dart';
import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/color.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          const HomeAppBar(),
          const SizedBox(height: 10),
          Expanded(
              child: ListView(shrinkWrap: true, children: [
            Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Column(children: [
                  const CarouselSlider(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Categories", style: paragraph5),
                      const Spacer(),
                      Image.asset(Assets.forwardArrow)
                    ],
                  )
                ])),
            const SizedBox(height: 17),
            Categories(),
            const SizedBox(height: 16),
            Container(
                color: const Color(0xFFF4F5F9),
                child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "Featured products",
                            style: paragraph5,
                          ),
                          const Spacer(),
                          Image.asset(Assets.forwardArrow)
                        ],
                      ),
                      Products()
                    ])))
          ]))
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appGreenColor,
          child: Image.asset(Assets.cartIconWhite),
          onPressed: () {},
        ));
  }
}
