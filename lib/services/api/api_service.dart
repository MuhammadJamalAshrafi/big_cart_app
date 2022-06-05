import 'dart:convert';

import 'package:big_cart_app/models/api_response.dart';
import 'package:big_cart_app/models/category.dart';
import 'package:big_cart_app/models/product.dart';
import 'package:big_cart_app/models/user.dart';
import 'package:big_cart_app/services/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _instance = ApiService._();
  ApiService._();

  static ApiService get instance => _instance;
  final String dataKey = "USER_DATA";

  Future<User> loginUser(String name, Map<String, dynamic> params) async {
    Map<String, dynamic> json =
        await ApiClient.instance.post("user/$name", params);
    User user = ApiResponse.fromJson(json, User.fromJson(json['data'])).data!;
    return user;
  }

  Future<int> placeOrder(String accessToken, dynamic params) async {
    try {
      var url = Uri.parse(ApiClient.instance.baseURL + 'order');
      http.Response responce = await http.post(url,
          headers: {
            "Authorization": "Bearer ${accessToken.toString()}",
            "Content-Type": "application/json"
          },
          body: params);
      Map<String, dynamic> json = jsonDecode(responce.body)["data"];
      int id = json["id"];
      return id;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<User> logoutUser(String accessToken) async {
    var url = Uri.parse(ApiClient.instance.baseURL + 'user/signout');
    try {
      http.Response responce = await http.get(
        url,
        headers: {"Authorization": "Bearer ${accessToken.toString()}"},
      );
      Map<String, dynamic> json = jsonDecode(responce.body);
      User user =
          ApiResponse<User>.fromJson(json, User.fromJson(json['data'])).data!;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.remove(dataKey);
      return user;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<User> signupUser(Map<String, dynamic> params) async {
    Map<String, dynamic> json = await ApiClient.instance.post("user", params);
    User user = ApiResponse.fromJson(json, User.fromJson(json['data'])).data!;
    return user;
  }

  Future<String> getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey(dataKey)) {
      try {
        User _user = User.fromJson(jsonDecode(pref.getString(dataKey) ?? ''));
        return _user.accessToken ?? '';
      } catch (e) {
        throw e.toString();
      }
    } else {
      return "";
    }
  }

  Future<List<Category>> getAllCategories(String accessToken) async {
    try {
      List<dynamic> decodedJSON =
          await ApiClient.instance.get("category", accessToken);
      List<Category> category =
          decodedJSON.map((json) => Category.fromJson(json)).toList();
      return category;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Product>> getAllProducts(String accessToken) async {
    try {
      List<dynamic> decodedJSON =
          await ApiClient.instance.get("product", accessToken);
      List<Product> product =
          decodedJSON.map((json) => Product.fromJson(json)).toList();
      return product;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Product>> getProductsByCategoryId(
      int catId, String accessToken) async {
    try {
      List<dynamic> decodedJSON = await ApiClient.instance
          .get("product/" + catId.toString(), accessToken);
      List<Product> product =
          decodedJSON.map((json) => Product.fromJson(json)).toList();
      return product;
    } catch (e) {
      throw e.toString();
    }
  }
}
