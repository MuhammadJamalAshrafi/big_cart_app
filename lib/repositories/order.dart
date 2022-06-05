import 'package:big_cart_app/repositories/order_interface.dart';
import 'package:big_cart_app/services/api/api_service.dart';

class OrderRepository extends IOrderRepository {
  OrderRepository();

  @override
  Future<int> placeOrder(dynamic params) async {
    try {
      String accessToken = await ApiService.instance.getAccessToken();
      int orderId = await ApiService.instance.placeOrder(accessToken, params);
      return orderId;
    } catch (e) {
      throw e.toString();
    }
  }
}
