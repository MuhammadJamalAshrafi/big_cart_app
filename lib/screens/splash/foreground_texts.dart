import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';

class ForegroundTexts extends StatelessWidget {
  const ForegroundTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 96, bottom: 31),
          child: Column(
            children: [
              Text("Welcome To", style: heading4),
              Image.asset("assets/images/logo.png", width: 127, height: 50),
              const SizedBox(height: 17),
              Text(
                "Lorem ipsum dolor sit amet, consetetur \n sadipscing elitr, sed diam nonumy",
                style: heading3,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text("POWERED BY", style: heading3),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                    text: "TECH ",
                    style: heading2,
                    children: [TextSpan(text: "IDARA", style: heading1)]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
