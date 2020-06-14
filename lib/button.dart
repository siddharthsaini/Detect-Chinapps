import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55.0,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

AppBar mainAppBar() {
  return AppBar(
    backgroundColor: Colors.orange[700],
    title: Text(
      'Chinese Apps Remover',
      style: TextStyle(
        color: Colors.white,
        // fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: <Widget>[
      PopupMenuButton(
        itemBuilder: (context) {
          return <PopupMenuItem<String>>[
            PopupMenuItem<String>(
              value: 'abt',
              child: Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            PopupMenuItem<String>(
              value: "pp",
              child: Text(
                'Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            PopupMenuItem<String>(
              value: "rate",
              child: Text(
                'Rate App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ];
        },
        onSelected: (key) async {
          if (key == "abt") {
            const url =
                'https://github.com/sidxharth/Chinese-Apps-Remover/blob/master/README.md';
            launch(url);
          }
          if (key == "pp") {
            const url =
                'https://github.com/sidxharth/Chinese-Apps-Remover/blob/master/Privacy-Policy.md';
            launch(url);
          }
          if (key == "rate") {
            const url = 'https://play.google.com/store/apps/details?id=tech.siddharthsaini.car';
            launch(url);
          }
        },
      )
    ],
  );
}
