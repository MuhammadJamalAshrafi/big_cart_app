import 'dart:convert';

import 'package:big_cart_app/models/category.dart';
import 'package:big_cart_app/models/user.dart';
import 'package:big_cart_app/repositories/category_interface.dart';
import 'package:big_cart_app/services/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryRepository implements ICategoryRepository {
  CategoryRepository();
  final String dataKey = "USER_DATA";

  @override
  Future<List<Category>> getAll() async {
    try {
      String accessToken = getAccessToken().toString();
      List<Category> categories =
          await ApiService.instance.getAllCategories(accessToken);
      return categories;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    try {
      User _user = User.fromJson(jsonDecode(pref.getString(dataKey) ?? ''));
      return _user.accessToken ?? '';
    } catch (e) {
      throw e.toString();
    }
  }
}
