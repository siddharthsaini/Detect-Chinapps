import 'package:car/button.dart';
import 'package:car/package.dart';
import 'package:flutter/material.dart';
import 'package:uninstall_apps/uninstall_apps.dart';
import 'dart:async';
import 'package:device_apps/device_apps.dart';
import 'package:share/share.dart';

class ListScreen extends StatefulWidget {
  static const id = 'listscreen';

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool _none = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _none = false;
            this.build(context);
          });
        },
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.refresh,
          color: Colors.white,
          size: 25,
        ),
        label: Text(
          "REFRESH",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Share.share(
              "Hey, I'm supporting #AtmaNirbharBharat by using Chinese Apps Remover to remove all chinese apps from my device, what about you? Click this link to use the app https://play.google.com/store/apps/details?id=tech.siddharthsaini.car");
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
        ),
        builder: (context, data) {
          List<dynamic> chinese = new List();
          if (_none == false) {
            Future.delayed(const Duration(milliseconds: 4000), () {
              if (data.data != null) {
                setState(() {
                  _none = true;
                });
              }
            });
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.orange[700],
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            ));
          } else {
            for (var apps in data.data) {
              for (var code in package) {
                if (apps.packageName == code) {
                  chinese.add(apps);
                }
              }
            }
            return chinese.isEmpty
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
                                "No Chinese Apps Found",
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
                          Application app = chinese[position];
                          return Stack(children: <Widget>[
                            GestureDetector(
                              onTap: (){},
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
                                        constraints: BoxConstraints.expand(),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 50, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "${app.appName}",
                                                    style: TextStyle(
                                                      fontSize: 17,
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
                                                  onPressed: () {
                                                    UninstallApps.uninstall(
                                                        app.packageName);
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 5000),
                                                        () {
                                                      setState(() {
                                                        this.build(context);
                                                      });
                                                    });
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 16.0,
                                      ),
                                      alignment: FractionalOffset.centerLeft,
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
                          ]);
                        },
                        itemCount: chinese.length),
                  );
          }
        },
      ),
    );
  }
}
