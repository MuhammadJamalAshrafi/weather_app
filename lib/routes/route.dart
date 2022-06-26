// Route Names

import 'package:flutter/material.dart';
import 'package:weather_app/views/home/home_screen.dart';
import 'package:weather_app/views/selection/selection_screen.dart';
import 'package:weather_app/views/splash/splash_screen.dart';

const String splashScreen = 'splash';
const String selectionScreen = 'selection';
const String homeScreen = 'home';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case selectionScreen:
      return MaterialPageRoute(builder: (context) => const SelectionScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());

    default:
      throw ('This route name does not exit');
  }
}
