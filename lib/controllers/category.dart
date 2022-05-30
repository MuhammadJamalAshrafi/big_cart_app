import 'package:big_cart_app/models/category.dart';
import 'package:big_cart_app/repositories/category.dart';

class CategoryController {
  final CategoryRepository _categoryRepository = CategoryRepository();

  Future<List<Category>> getAll() {
    try {
      return _categoryRepository.getAll();
    } catch (e) {
      throw e.toString();
    }
  }
}
