import 'package:big_cart_app/controllers/user.dart';
import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/color.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:big_cart_app/widgets/app_button.dart';
import 'package:big_cart_app/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:big_cart_app/routes/route.dart' as route;

class SignupForm extends StatelessWidget {
  SignupForm({Key? key}) : super(key: key);

  final UserController _userController = UserController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 434,
        decoration: const BoxDecoration(
            color: appWhiteColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 17, right: 17, bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create account", style: heading5),
              const SizedBox(height: 2),
              Text("Quickly create account", style: paragraph2),
              const SizedBox(height: 26),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: AppTextField(
                      style: paragraph1,
                      placeholder: "Email Address",
                      hintStyle: paragraph1,
                      prefixIcon: Assets.emailIcon,
                      textController: emailCtrl,
                      obscureText: false,
                      enableSuggestions: true,
                      autocorrect: true,
                      issuffixIcon: false),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: AppTextField(
                      style: paragraph1,
                      placeholder: "Phone Number",
                      hintStyle: paragraph1,
                      prefixIcon: Assets.phoneIcon,
                      textController: phoneCtrl,
                      obscureText: false,
                      enableSuggestions: true,
                      autocorrect: true,
                      issuffixIcon: false),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: AppTextField(
                    hintStyle: paragraph1,
                    placeholder: "Password",
                    prefixIcon: Assets.passwordIcon,
                    textController: passwordCtrl,
                    style: paragraph1,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    issuffixIcon: true,
                    suffixIcon: Assets.passwordShowIcon,
                  ),
                ),
              ),
              const SizedBox(height: 17),
              GestureDetector(
                  onTap: () async {
                    await _userController.signup({
                      'email': emailCtrl.text,
                      'phone': phoneCtrl.text,
                      'password': passwordCtrl.text
                    });
                    Navigator.pushNamedAndRemoveUntil(
                        context, route.homeScreen, (route) => true);
                  },
                  child: const AppButton(name: "Signup")),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account ? ",
                      style: paragraph4,
                      children: [
                        TextSpan(
                            text: "Login",
                            style: paragraph4.copyWith(color: Colors.black),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, route.loginScreen);
                              })
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
