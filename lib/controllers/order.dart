import 'dart:convert';

import 'package:big_cart_app/repositories/order.dart';

class OrderController {
  final OrderRepository _orderRepository = OrderRepository();

  Future<int> placeOrder(
    String name,
    String email,
    String phno,
    String address,
    String zip,
    String city,
    String country,
    List<Map<String, dynamic>> items,
  ) async {
    var params = jsonEncode({
      "name": name,
      "email": email,
      "phoneNumber": phno,
      "address": address,
      "zip": zip,
      "city": city,
      "country": country,
      "items": items,
    });
    return await _orderRepository.placeOrder(params);
  }
}
