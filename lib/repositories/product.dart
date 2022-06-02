import 'package:big_cart_app/models/product.dart';
import 'package:big_cart_app/repositories/product_interface.dart';
import 'package:big_cart_app/services/api/api_service.dart';

class ProductRepository implements IProductRepository {
  ProductRepository();

  @override
  Future<List<Product>> getAll() async {
    try {
      String accessToken = await ApiService.instance.getAccessToken();
      List<Product> product =
          await ApiService.instance.getAllProducts(accessToken);
      return product;
    } catch (e) {
      throw e.toString();
    }
  }
}
