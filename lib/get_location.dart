import 'package:flutter/material.dart';

class GetLocation extends StatelessWidget {
  const GetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Get Location"),
              onPressed: () {
                _getCurrentLocation();
              },
            )
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {}
}
