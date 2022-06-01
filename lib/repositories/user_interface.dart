import 'package:big_cart_app/models/api_response.dart';
import 'package:big_cart_app/models/user.dart';

abstract class IUserRepository {
  Future<void> login(Map<String, dynamic> params);
  Future<void> signup(Map<String, dynamic> params);
  Future<void> saveUser();
  Future<String> loadUser();
}
