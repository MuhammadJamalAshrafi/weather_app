import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/utils/assets.dart';
import 'package:weather_app/utils/styles/text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
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
                    Text("Australia", style: paragraph3),
                    const SizedBox(width: 20),
                    Image.asset(Assets.dropDownIcon)
                  ],
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height / 4) - 100),
                Column(
                  children: [
                    Text("12\u{00b0}", style: heading2),
                    Text("Nighty Clear Sky", style: paragraph3),
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
                  Text("Sydney, Australia", style: paragraph4)
                ],
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Now", style: paragraph5),
                      const SizedBox(height: 14),
                      Image.asset(Assets.weatherIcon),
                      const SizedBox(height: 12),
                      Text("22\u{00b0}", style: paragraph5)
                    ],
                  ),
                  Column(
                    children: [
                      Text("Now", style: paragraph5),
                      const SizedBox(height: 14),
                      Image.asset(Assets.weatherIcon),
                      const SizedBox(height: 12),
                      Text("22\u{00b0}", style: paragraph5)
                    ],
                  ),
                  Column(
                    children: [
                      Text("Now", style: paragraph5),
                      const SizedBox(height: 14),
                      Image.asset(Assets.weatherIcon),
                      const SizedBox(height: 12),
                      Text("22\u{00b0}", style: paragraph5)
                    ],
                  ),
                  Column(
                    children: [
                      Text("Now", style: paragraph5),
                      const SizedBox(height: 14),
                      Image.asset(Assets.weatherIcon),
                      const SizedBox(height: 12),
                      Text("22\u{00b0}", style: paragraph5)
                    ],
                  ),
                  Column(
                    children: [
                      Text("Now", style: paragraph5),
                      const SizedBox(height: 14),
                      Image.asset(Assets.weatherIcon),
                      const SizedBox(height: 12),
                      Text("22\u{00b0}", style: paragraph5)
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
