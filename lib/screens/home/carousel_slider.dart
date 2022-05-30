import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.bannerImage,
          height: 327,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          left: 61,
          top: 173,
          child: Text(
            "20% off on your\nfirst purchase",
            style: paragraph5,
          ),
        ),
        Positioned(
            left: 16,
            bottom: 30,
            child: Row(
              children: [
                Container(
                  height: 6,
                  width: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6CC51D),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(width: 7),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(width: 7),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
