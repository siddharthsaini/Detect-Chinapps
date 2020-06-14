import 'package:car/listscreen.dart';
import 'package:car/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'about.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chinese Apps Remover',
      home: Splash(),
      routes: {
        // HomePage.id: (context) => HomePage(),
        ListScreen.id: (context) => ListScreen(),
        About.id: (context) => About(),
      },
    );
  }
}
