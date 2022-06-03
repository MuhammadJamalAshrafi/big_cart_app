import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String name;
  final String? suffixIcon;
  final bool issuffixIcon;

  const CustomAppBar(
      {Key? key,
      required this.name,
      this.suffixIcon,
      required this.issuffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, right: 17, left: 17),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(Assets.backArrowBlack)),
            SizedBox(width: (MediaQuery.of(context).size.width / 2) - 100),
            Text(name, style: paragraph5.copyWith(fontWeight: FontWeight.w500)),
            const Spacer(),
            if (issuffixIcon == true) Image.asset(suffixIcon ?? "")
          ],
        ),
      ),
    );
  }
}
