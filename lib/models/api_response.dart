import 'package:big_cart_app/models/api_data_model.dart';

class ApiResponse<T extends ApiDataModel> {
  String? message;
  int? statusCode;
  T? data;

  ApiResponse(
      {required this.message, required this.statusCode, required this.data});

  ApiResponse.fromJson(Map<String, dynamic> json, T data) {
    message = json['message'];
    statusCode = json['statusCode'];
    this.data = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['data'] = this.data!.toJson();

    return data;
  }
}
