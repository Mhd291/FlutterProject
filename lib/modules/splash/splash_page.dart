import 'package:flutter/material.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/modules/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {

  SplashController controller = SplashController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Center(
          child: Text(
            "Welcome To Monfy",
                style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
