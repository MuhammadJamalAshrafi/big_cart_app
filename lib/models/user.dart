import 'package:big_cart_app/models/api_data_model.dart';

class User implements ApiDataModel {
  int? id;
  String? email;
  String? phone;
  String? password;
  String? accessToken;

  User({this.id, this.email, this.phone, this.password, this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    accessToken = json['accessToken'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
