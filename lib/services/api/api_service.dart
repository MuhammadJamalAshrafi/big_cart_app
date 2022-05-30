import 'package:big_cart_app/models/api_response.dart';
import 'package:big_cart_app/models/user.dart';
import 'package:big_cart_app/services/api/api_client.dart';

class ApiService {
  static final ApiService _instance = ApiService._();
  ApiService._();

  static ApiService get instance => _instance;

  Future<User> loginUser(String name, Map<String, dynamic> params) async {
    Map<String, dynamic> json =
        await ApiClient.instance.post("user/$name", params);
    User user = ApiResponse.fromJson(json, User.fromJson(json['data'])).data!;
    return user;
  }

  Future<User> signupUser(String name, Map<String, dynamic> params) async {
    Map<String, dynamic> json =
        await ApiClient.instance.post("user/$name", params);
    User user = ApiResponse.fromJson(json, User.fromJson(json['data'])).data!;
    return user;
  }
}
