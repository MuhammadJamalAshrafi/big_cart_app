import 'package:big_cart_app/screens/home/categories.dart';
import 'package:big_cart_app/screens/home/home_appbar.dart';
import 'package:big_cart_app/screens/home/carousel_slider.dart';
import 'package:big_cart_app/utils/assets.dart';
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
            const Categories()
          ]))
        ]));
  }
}
