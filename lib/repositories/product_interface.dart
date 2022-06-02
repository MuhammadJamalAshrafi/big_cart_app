import 'package:big_cart_app/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getAll();
}
