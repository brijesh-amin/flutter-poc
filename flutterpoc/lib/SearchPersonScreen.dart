import 'package:flutter/material.dart';
import 'search_person.dart';

class SearchPersonScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Search',
      debugShowCheckedModeBanner: false,
      home: new SearchList(),
    );
  }
}