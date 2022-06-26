import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/controllers/weather.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/services/geo_location.dart';
import 'package:weather_app/utils/assets.dart';
import 'package:weather_app/utils/styles/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _weatherController = WeatherController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    print(GeoLocation().location.toString());
    await _weatherController.getWeather(GeoLocation().location);
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return (isLoading == false)
        ? Scaffold(
            body: Column(
            children: [
              Stack(children: [
                Image.asset(
                  Assets.weatherImage,
                  fit: BoxFit.cover,
                  width: width,
                  // height: MediaQuery.of(context).size.height / 1.35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23, top: 61),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(Assets.refreshIcon),
                          SizedBox(width: (width / 2 - 100)),
                          Text(_weatherController.countryName.toString(),
                              style: paragraph3),
                          const SizedBox(width: 20),
                          Image.asset(Assets.dropDownIcon)
                        ],
                      ),
                      SizedBox(
                          height:
                              (MediaQuery.of(context).size.height / 4) - 100),
                      Column(
                        children: [
                          Text("${_weatherController.temperature}\u{00b0}",
                              style: heading2),
                          Text(_weatherController.weatherText.toString(),
                              style: paragraph3),
                        ],
                      )
                    ],
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 44, right: 22),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Today", style: paragraph2),
                        const Spacer(),
                        Text(
                            "${_weatherController.cityName}, ${_weatherController.countryName}",
                            style: paragraph4)
                      ],
                    ),
                    const SizedBox(height: 36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                            _weatherController.forecastItems.length,
                            (index) => Column(
                                  children: [
                                    Text(
                                        _weatherController.forecastItems[index]
                                            ["time"],
                                        style: paragraph5),
                                    const SizedBox(height: 14),
                                    Image.asset(Assets.weatherIcon),
                                    const SizedBox(height: 12),
                                    Text(
                                        "${_weatherController.forecastItems[index]["temp"]}\u{00b0}",
                                        style: paragraph5)
                                  ],
                                ))
                        // Column(
                        //   children: [
                        //     Text("Now", style: paragraph5),
                        //     const SizedBox(height: 14),
                        //     Image.asset(Assets.weatherIcon),
                        //     const SizedBox(height: 12),
                        //     Text("22\u{00b0}", style: paragraph5)
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     Text("Now", style: paragraph5),
                        //     const SizedBox(height: 14),
                        //     Image.asset(Assets.weatherIcon),
                        //     const SizedBox(height: 12),
                        //     Text("22\u{00b0}", style: paragraph5)
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     Text("Now", style: paragraph5),
                        //     const SizedBox(height: 14),
                        //     Image.asset(Assets.weatherIcon),
                        //     const SizedBox(height: 12),
                        //     Text("22\u{00b0}", style: paragraph5)
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     Text("Now", style: paragraph5),
                        //     const SizedBox(height: 14),
                        //     Image.asset(Assets.weatherIcon),
                        //     const SizedBox(height: 12),
                        //     Text("22\u{00b0}", style: paragraph5)
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     Text("Now", style: paragraph5),
                        //     const SizedBox(height: 14),
                        //     Image.asset(Assets.weatherIcon),
                        //     const SizedBox(height: 12),
                        //     Text("22\u{00b0}", style: paragraph5)
                        //   ],
                        // )
                      ],
                    )
                  ],
                ),
              )
            ],
          ))
        : Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [CircularProgressIndicator()],
            ),
          );
  }
}
