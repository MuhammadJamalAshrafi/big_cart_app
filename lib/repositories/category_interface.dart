import 'package:big_cart_app/models/category.dart';

abstract class ICategoryRepository {
  Future getAll();
  Future getAccessToken();
}
