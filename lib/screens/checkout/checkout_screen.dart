import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:big_cart_app/widgets/app_button.dart';
import 'package:big_cart_app/widgets/app_text_field.dart';
import 'package:big_cart_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:big_cart_app/routes/route.dart' as route;

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController zipcodeCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
        backgroundColor: const Color(0xFFF4F5F9),
        body: Column(children: [
          const CustomAppBar(name: "Checkout", issuffixIcon: false),
          const SizedBox(height: 42),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, bottom: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: AppTextField(
                          style: paragraph1,
                          placeholder: "Name",
                          hintStyle: paragraph1,
                          prefixIcon: Assets.nameIcon,
                          textController: nameCtrl,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          issuffixIcon: false),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: AppTextField(
                          style: paragraph1,
                          placeholder: "Address",
                          hintStyle: paragraph1,
                          prefixIcon: Assets.addressIcon,
                          textController: addressCtrl,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          issuffixIcon: false),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: AppTextField(
                          style: paragraph1,
                          placeholder: "Zip Code",
                          hintStyle: paragraph1,
                          prefixIcon: Assets.zipcodeIcon,
                          textController: zipcodeCtrl,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          issuffixIcon: false),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: AppTextField(
                          style: paragraph1,
                          placeholder: "City",
                          hintStyle: paragraph1,
                          prefixIcon: Assets.cityIcon,
                          textController: cityCtrl,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          issuffixIcon: false),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: AppTextField(
                          style: paragraph1,
                          placeholder: "Country",
                          hintStyle: paragraph1,
                          prefixIcon: Assets.countryIcon,
                          textController: countryCtrl,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          issuffixIcon: false),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, route.shippingInformationScreen);
                      },
                      child: const AppButton(name: "Next"))
                ],
              ),
            ),
          )
        ]));
    // return Container(
    //   color: Colors.white,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const CircularProgressIndicator(),
    //       const SizedBox(height: 10),
    //       Text("Order Placing ...", style: heading3)
    //     ],
    //   ),
    // );
  }
}
