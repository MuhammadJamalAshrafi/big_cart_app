import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';

class Backgrund extends StatelessWidget {
  const Backgrund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Image.asset(Assets.loginBackground,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height / 2) + 100),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 68),
            child: Row(
              children: [
                Image.asset(Assets.backArrow),
                SizedBox(width: (MediaQuery.of(context).size.width / 2) - 107),
                Text(
                  "Welcome",
                  style: heading6,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
