import 'dart:convert';

import 'package:big_cart_app/models/user.dart';
import 'package:big_cart_app/repositories/user_interface.dart';
import 'package:big_cart_app/services/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository implements IUserRepository {
  UserRepository();
  User? _user;
  final String dataKey = "USER_DATA";

  @override
  Future<void> login(Map<String, dynamic> params) async {
    _user = await ApiService.instance.loginUser("signin", params);
    saveUser();
  }

  @override
  Future<void> signup(Map<String, dynamic> params) async {
    _user = await ApiService.instance.signupUser(params);
    saveUser();
  }

  @override
  Future<void> saveUser() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(dataKey, jsonEncode(_user?.toJson()));
  }

  @override
  Future<String> loadUser() async {
    return await ApiService.instance.getAccessToken();
  }

  @override
  Future logout() async {
    String accessToken = await ApiService.instance.getAccessToken();
    return await ApiService.instance.logoutUser(accessToken);
  }
}
