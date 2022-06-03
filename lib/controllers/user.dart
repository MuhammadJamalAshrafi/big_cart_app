import 'package:big_cart_app/repositories/user.dart';

class UserController {
  final UserRepository _userRepository = UserRepository();

  Future login(Map<String, dynamic> params) {
    return _userRepository.login(params);
  }

  Future signup(Map<String, dynamic> params) {
    return _userRepository.signup(params);
  }

  Future isLogin() {
    return _userRepository.loadUser();
  }

  Future logout() async {
    return _userRepository.logout();
  }
}
