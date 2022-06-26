import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/services/api/api_client.dart';

class ApiService {
  static final ApiService _instance = ApiService._();
  ApiService._();

  static ApiService get instance => _instance;

  static Future<WeatherResponse> getWeather(String param) async {
    try {
      Map<String, dynamic> json = await ApiClient.instance.get(param);
      return WeatherResponse.fromJson(json);
    } catch (e) {
      throw e.toString();
    }
  }
}
