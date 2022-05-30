import 'package:big_cart_app/controllers/user.dart';
import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/color.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:big_cart_app/widgets/app_button.dart';
import 'package:big_cart_app/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:big_cart_app/routes/route.dart' as route;

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final UserController _userController = UserController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -23,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: appWhiteColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 17, right: 17, bottom: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back !", style: heading5),
              const SizedBox(height: 2),
              Text("Sign in to your account", style: paragraph2),
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
              const SizedBox(height: 21),
              Padding(
                padding: const EdgeInsets.only(left: 9, right: 9),
                child: Row(
                  children: [
                    Image.asset(Assets.rememberIcon),
                    const SizedBox(width: 9.43),
                    Text("Remember me", style: paragraph1),
                    const Spacer(),
                    Text("Forgot password",
                        style: paragraph1.copyWith(color: appBlueColor)),
                  ],
                ),
              ),
              const SizedBox(height: 17),
              GestureDetector(
                  onTap: () async {
                    await _userController.login({
                      'email': emailCtrl.text,
                      'password': passwordCtrl.text
                    });
                    Navigator.pushNamedAndRemoveUntil(
                        context, route.homeScreen, (route) => true);
                  },
                  child: const AppButton(name: "Login")),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Don’t have an account ? ",
                      style: paragraph4,
                      children: [
                        TextSpan(
                            text: "Sign up",
                            style: paragraph5.copyWith(fontSize: 15),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, route.signupScreen);
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
