class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;

  Astro({this.sunrise, this.sunset, this.moonrise, this.moonset});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
  }
}
