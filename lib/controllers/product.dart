import 'package:big_cart_app/models/product.dart';
import 'package:big_cart_app/repositories/product.dart';

class ProductController {
  final ProductRepository _productRepository = ProductRepository();

  Future<List<Product>> getAll() {
    try {
      return _productRepository.getAll();
    } catch (e) {
      throw e.toString();
    }
  }
}
