import 'package:weather_app/models/astro.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/hour.dart';

class Forecastday {
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }
}
