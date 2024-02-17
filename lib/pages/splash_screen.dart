//splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:krncheck/pages/loginpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Loginpage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://www.gbtechnologies.in/assets/img/logo_lgr.png',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
