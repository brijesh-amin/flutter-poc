import 'package:flutter/material.dart';
import 'package:flutter_bloc/SearchPersonScreen.dart';
import 'homeScreen.dart';
import 'login.dart';
import 'splashScreen.dart';

void main() => runApp(new MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/HomeScreen": (BuildContext context) => HomeScreen(),
          "/login": (BuildContext context) => login(),
          "/SearchPersonScreen": (BuildContext context) => SearchPersonScreen(),
        },
        home:
        SplashScreen(),
      );
    }
  }