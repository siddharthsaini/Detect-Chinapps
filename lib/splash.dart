import 'dart:async';
import 'package:car/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), onCloseDialog);
  }

  void onCloseDialog() {
    if (mounted) {
      Navigator.of(context).pushReplacementNamed(About.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
                5.3, 2.0),
            colors: [
              Colors.red[600],
              Colors.yellow[600],
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: MediaQuery.of(context).size.width*0.75,
                ),
                // SvgPicture.asset(
                //   'images/logo.svg',
                //   semanticsLabel: 'Acme Logo',
                //   height: MediaQuery.of(context).size.width * 0.75,
                //   width: MediaQuery.of(context).size.width * 0.75,
                // ),
                Text(
                  "CHINESE APPS REMOVER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
