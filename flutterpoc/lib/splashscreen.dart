import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'platformScaffold.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() =>  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 3;

  startTime() async {
    return Timer(
        Duration(seconds: splashDuration),
            () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Navigator.of(context).pushReplacementNamed('/login');
        }
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer();

    return PlatformScaffold(drawer: drawer,
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                Expanded(child:
                Container(decoration: BoxDecoration(color: Colors.white),
                  child:
                  Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.none

                  ),
                ),
                ),
                Container(margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child:
                  Text("Version 1.0.0\n@Copyright Castleton 2019", style: TextStyle(fontSize: 16.0, color: Colors.black,),
                  ),
                ),
              ],
            )
        )
    );
  }
}