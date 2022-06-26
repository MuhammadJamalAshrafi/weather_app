import 'package:weather_app/models/condition.dart';

class Current {
  double? tempC;
  Condition? condition;
  int? cloud;
  double? uv;

  Current({this.tempC, this.condition, this.uv});

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    cloud = json['cloud'];
    uv = json['uv'];
  }
}
