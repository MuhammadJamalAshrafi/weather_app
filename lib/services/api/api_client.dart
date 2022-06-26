import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _instance = ApiClient._();
  ApiClient._();
  static ApiClient get instance => _instance;

  final String _baseURL = "http://api.weatherapi.com/v1/forecast.json?";
  final String _key = "210f2665d3c44b0290262105222606";

  Future<Map<String, dynamic>> get(String param) async {
    var url = Uri.parse("${_baseURL}key=$_key&q=$param&days=1");
    try {
      http.Response response = await http.get(url);
      return jsonDecode(response.body);
    } catch (e) {
      throw e.toString();
    }
  }
}
