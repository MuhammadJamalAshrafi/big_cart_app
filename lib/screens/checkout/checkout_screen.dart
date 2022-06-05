import 'package:big_cart_app/controllers/order.dart';
import 'package:big_cart_app/providers/cart_provider.dart';
import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:big_cart_app/widgets/app_button.dart';
import 'package:big_cart_app/widgets/app_text_field.dart';
import 'package:big_cart_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:big_cart_app/routes/route.dart' as route;
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController nameCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();

  TextEditingController phoneCtrl = TextEditingController();

  TextEditingController addressCtrl = TextEditingController();

  TextEditingController zipcodeCtrl = TextEditingController();

  TextEditingController cityCtrl = TextEditingController();

  TextEditingController countryCtrl = TextEditingController();

  final OrderController _orderController = OrderController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return (isLoading == false)
        ? Scaffold(
            backgroundColor: Color(0xFFF4F5F9),
            resizeToAvoidBottomInset: false,
            body: Column(children: [
              const CustomAppBar(name: "Checkout", issuffixIcon: false),
              const SizedBox(height: 42),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 17,
                    right: 17,
                    // bottom: MediaQuery.of(context).viewInsets.bottom
                  ),
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
                            List<Map<String, dynamic>> items = cartProvider
                                .getProductList
                                .map((e) => e.toJson())
                                .toList();
                            placeOrder(context, items);
                          },
                          child: const AppButton(name: "Next"))
                    ],
                  ),
                ),
              )
            ]))
        : Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 15),
                Text("Order Placing ...", style: heading3)
              ],
            ),
          );
  }

  void placeOrder(context, items) async {
    setState(() {
      isLoading = !isLoading;
    });
    var id = await _orderController.placeOrder(
        nameCtrl.text,
        emailCtrl.text,
        phoneCtrl.text,
        addressCtrl.text,
        zipcodeCtrl.text,
        cityCtrl.text,
        countryCtrl.text,
        items);
    Navigator.pushNamedAndRemoveUntil(
        context, route.shippingInformationScreen, (route) => false,
        arguments: id);
  }
}
