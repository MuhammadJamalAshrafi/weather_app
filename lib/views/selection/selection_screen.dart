import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/services/geo_location.dart';
import 'package:weather_app/utils/assets.dart';
import 'package:weather_app/utils/styles/color.dart';
import 'package:weather_app/utils/styles/text.dart';
import 'package:weather_app/routes/route.dart' as route;

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 68),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 32),
              child: RichText(
                text: TextSpan(text: "Hello,\n", style: heading1, children: [
                  TextSpan(
                      text: "let's set you\n",
                      style: heading1.copyWith(color: appGreyColor)),
                  TextSpan(
                      text: "weather...",
                      style: heading1.copyWith(color: appPrimaryColor))
                ]),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(Assets.loginScreenDesign, fit: BoxFit.fill)),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 21, right: 22, bottom: 53),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (() async {
                      await GeoLocation().getCurrentLocation(null);
                      Navigator.pushNamedAndRemoveUntil(
                          context, route.homeScreen, (route) => true);
                    }),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 29),
                      width: MediaQuery.of(context).size.width,
                      height: 72,
                      decoration: BoxDecoration(
                          color: appSeconaryGreyColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: appBorderGreyColor)),
                      child: Row(
                        children: [
                          Text("Select Current Location", style: paragraph2),
                          const Spacer(),
                          Image.asset(Assets.rightArrow)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 29),
                    width: MediaQuery.of(context).size.width,
                    height: 72,
                    decoration: BoxDecoration(
                        color: appPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text("Select City",
                            style: paragraph2.copyWith(color: Colors.white)),
                        const Spacer(),
                        Image.asset(Assets.dropDownIcon)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
