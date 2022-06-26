import 'package:weather_app/models/condition.dart';

class Hour {
  String? time;
  double? tempC;
  double? tempF;
  Condition? condition;
  Hour({this.time, this.tempC, this.tempF, this.condition});

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }
}
