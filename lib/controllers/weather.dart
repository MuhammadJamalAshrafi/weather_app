import 'package:weather_app/models/hour.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/services/api/api_service.dart';
import 'package:intl/intl.dart';

class WeatherController {
  late String cityName, countryName, weatherText, temperature;
  getWeather(String param) async {
    print(param);
    WeatherResponse weatherResponse = await ApiService.getWeather(param);
    cityName = weatherResponse.location!.name!;
    countryName = weatherResponse.location!.country!;
    weatherText = weatherResponse.current!.condition!.text!;
    temperature = weatherResponse.current!.tempC!.toStringAsFixed(0);
    int time = DateTime.now().hour;
    forecastItems = List.generate(5, (index) {
      if (index == 0) {
        return {
          "time": 'now',
          "temp": weatherResponse.current!.tempC.toString()
        };
      } else {
        String newTime = (time + index).toString().padLeft(2, "0") + ':' + "00";
        for (Hour hour in weatherResponse.forecast!.forecastday![0].hour!) {
          if (hour.time!.split(" ")[1] == newTime) {
            DateTime tempDate = DateFormat("hh:mm").parse(newTime);
            var dateFormat = DateFormat("h:mm a");
            String newFormat = dateFormat.format(tempDate);
            return {"time": newFormat, "temp": hour.tempC.toString()};
          }
        }
      }
      return {"time": 'now', "temp": "22"};
    });
  }

  List<Map> forecastItems = [
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"}
  ];
}
