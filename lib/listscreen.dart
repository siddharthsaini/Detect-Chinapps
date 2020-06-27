import 'package:car/button.dart';
import 'package:car/package.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:device_apps/device_apps.dart';
import 'package:share/share.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;
import 'package:url_launcher/url_launcher.dart';

class ListScreen extends StatefulWidget {
  static const id = 'listscreen';

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            ListScreen();
          });
        },
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.refresh,
          color: Colors.white,
          size: 25,
        ),
        label: Text(
          "RESCAN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Share.share("Hey, I'm supporting *#AtmaNirbharBharat* by using *Detect Chinapps* to detect and remove all Chinese Apps from my device, *what about you?*\n\n" +
              "This app allows you to *detect 200+ chinese apps* from your device and *suggests alternative apps*.\n\n" +
              "Click this link to *install* the app https://play.google.com/store/apps/details?id=tech.siddharthsaini.car");
        },
        child: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.red[800], Colors.orange[400]],
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SHARE THIS APP  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: mainAppBar(),
      body: FutureBuilder(
        future: DeviceApps.getInstalledApplications(
          includeAppIcons: true,
          includeSystemApps: false,
          onlyAppsWithLaunchIntent: false,
        ),
        builder: (context, data) {
          if (data.data == null) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.orange[700],
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            ));
          } else {
            List<Application> chineseapps = data.data;
            List<Application> apps = List<Application>();

            chineseapps.forEach((element) {
              if (package.contains(element.packageName) == true &&
                  element.systemApp == false) {
                apps.add(element);
              }
            });

            return apps.isEmpty
                ? Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(5.3, 2.0),
                          colors: [
                            Colors.green[700],
                            Colors.yellow[400],
                          ],
                          tileMode: TileMode.repeated,
                        ),
                      ),
                      height: MediaQuery.of(context).size.width * 0.9,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 200,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Column(
                            children: [
                              Text(
                                "SUCCESS",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "No Chinapps Found",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: ListView.builder(
                        itemBuilder: (context, position) {
                          Application app = apps[position];
                          return Column(
                            children: [
                              Stack(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {},
                                    child: new Container(
                                      height: 90.0,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 40, right: 18.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              boxShadow: <BoxShadow>[],
                                            ),
                                            child: Container(
                                              constraints:
                                                  BoxConstraints.expand(),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 45, right: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          "${app.appName}",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${app.packageName}",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.delete_forever,
                                                        color: Colors.red,
                                                        size: 35,
                                                      ),
                                                      onPressed: () async {
                                                        String ck =
                                                            app.packageName;
                                                        String an = app.appName;
                                                        android_intent.Intent()
                                                          ..setAction(
                                                              android_action
                                                                  .Action
                                                                  .ACTION_DELETE)
                                                          ..setData(Uri.parse(
                                                              "package:${app.packageName}"))
                                                          ..startActivityForResult()
                                                              .then(
                                                                  (data) async {
                                                            bool isInstalled =
                                                                await DeviceApps
                                                                    .isAppInstalled(
                                                                        ck);
                                                            if (isInstalled ==
                                                                false) {
                                                              Fluttertoast.showToast(
                                                                  msg:
                                                                      '$an App Deleted',
                                                                  toastLength: Toast
                                                                      .LENGTH_LONG,
                                                                  gravity:
                                                                      ToastGravity
                                                                          .BOTTOM,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  textColor:
                                                                      Colors
                                                                          .white);
                                                              apps.removeAt(
                                                                  position);
                                                              setState(() {
                                                                ListScreen();
                                                              });
                                                            }
                                                          }, onError: (e) {
                                                            print(e);
                                                            print('fail');
                                                          });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 16.0,
                                            ),
                                            alignment:
                                                FractionalOffset.centerLeft,
                                            child: Image(
                                              image: app is ApplicationWithIcon
                                                  ? MemoryImage(app.icon)
                                                  : null,
                                              height: 80,
                                              width: 80,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () async {
                                  String url =
                                      'https://www.google.com/search?q=alternative+apps+for+${app.appName}';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                color: Colors.grey[300],
                                child: Text('Alternatives for ${app.appName}'),
                              ),
                            ],
                          );
                        },
                        itemCount: apps.length),
                  );
          }
        },
      ),
    );
  }
}