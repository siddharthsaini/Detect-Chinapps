import 'package:car/listscreen.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class About extends StatelessWidget {
  static const id = 'about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.asset(
                'images/about.png',
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Text(
              "Tap on 'SCAN DEVICE NOW' to find installed Chinapps in your device.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                letterSpacing: 1.3,
              ),
            ),
            RaisedGradientButton(
                child: Text(
                  'SCAN DEVICE NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                gradient: LinearGradient(
                  colors: <Color>[Colors.red[600], Colors.yellow[600]],
                ),
                onPressed: () async {
                  Navigator.of(context).pushReplacementNamed(ListScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
