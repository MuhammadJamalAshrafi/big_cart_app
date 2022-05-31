import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _instance = ApiClient._();
  ApiClient._();
  static ApiClient get instance => _instance;

  final String baseURL = "http://ishaqhassan.com:2000/";

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> params) async {
    return jsonDecode(
        (await http.post(Uri.parse(baseURL + endpoint), body: params)).body);
  }

  Future<List<dynamic>> get(String endpoint, String accessToken) async {
    var url = Uri.parse(baseURL + endpoint);
    try {
      return jsonDecode((await http.get(url,
              headers: {"Authorization": "Bearer ${accessToken.toString()}"}))
          .body)['data'];
    } catch (e) {
      throw e.toString();
    }
  }
}
