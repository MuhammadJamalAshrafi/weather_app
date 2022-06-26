import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/utils/assets.dart';
import 'package:weather_app/utils/styles/text.dart';
import 'package:weather_app/routes/route.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateScreen();
  }

  navigateScreen() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, route.selectionScreen, (route) => true));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 81,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.logoImage))),
          ),
          Text("Powered By Tech Idara", style: paragraph1)
        ],
      ),
    );
  }
}
