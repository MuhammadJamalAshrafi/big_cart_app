import 'package:big_cart_app/utils/styles/color.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String name;
  const AppButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 10.0),
                blurRadius: 9,
                color: Color.fromRGBO(108, 197, 29, 0.25))
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              appGreenColor.withOpacity(1.0),
              appGreenSecondary.withOpacity(0.91),
            ],
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(name,
              style: paragraph5.copyWith(color: Colors.white, fontSize: 15))),
    );
  }
}
