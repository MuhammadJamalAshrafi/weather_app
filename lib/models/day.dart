import 'package:weather_app/models/condition.dart';

class Day {
  double? avgtempC;
  double? avgtempF;
  Condition? condition;

  Day({this.avgtempC, this.avgtempF, this.condition});

  Day.fromJson(Map<String, dynamic> json) {
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }
}
