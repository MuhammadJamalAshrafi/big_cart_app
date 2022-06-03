import 'package:big_cart_app/controllers/user.dart';
import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:big_cart_app/routes/route.dart' as route;

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key}) : super(key: key);
  UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 51, left: 17, right: 17),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xFFF4F5F9),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(left: 21, right: 16.05),
          child: Row(
            children: [
              Image.asset(Assets.searchIcon),
              const SizedBox(width: 20.25),
              Expanded(
                child: TextField(
                  style: paragraph4,
                  decoration: InputDecoration(
                      hintText: "Search Keywords..",
                      hintStyle: paragraph4,
                      border: InputBorder.none),
                ),
              ),
              GestureDetector(
                child: Image.asset(Assets.logoutIcon),
                onTap: () {
                  _userController.logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, route.loginScreen, (route) => true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
