import 'package:big_cart_app/models/api_data_model.dart';

class Category implements ApiDataModel {
  int? id;
  String? title;
  String? icon;
  String? color;

  Category({this.id, this.title, this.icon, this.color});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    color = json['color'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    data['color'] = color;
    return data;
  }
}
