import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Image.asset(
            Assets.signupBackground,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 540,
          ),
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
