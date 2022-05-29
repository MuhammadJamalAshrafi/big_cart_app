import 'package:big_cart_app/models/api_response.dart';
import 'package:big_cart_app/models/user.dart';

abstract class IUserRepository {
  Future<void> signup(User user);
  Future login(Map<String, dynamic> params);
  Future saveUser();
  Future loadUser();
}
