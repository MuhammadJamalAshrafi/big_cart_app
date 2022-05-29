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
  Future<void> signup(User user) {
    throw UnimplementedError();
  }

  @override
  Future login(Map<String, dynamic> params) async {
    _user = await ApiService.instance.loginUser("signin", params);
    saveUser();
  }

  @override
  Future<void> saveUser() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(dataKey, jsonEncode(_user?.toJson()));
  }

  @override
  Future loadUser() async {
    final pref = await SharedPreferences.getInstance();
    try {
      _user = User.fromJson(jsonDecode(pref.getString(dataKey) ?? ''));
      return _user?.accessToken ?? '';
    } catch (e) {
      return;
    }
  }
}
