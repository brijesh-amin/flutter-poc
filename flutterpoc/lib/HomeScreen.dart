import 'package:flutter/material.dart';
BuildContext con;
class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    con = context;
      return Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new OutlineButton(
              child: new Text('Person'),
              onPressed: _searchPersonBtnClicked,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              borderSide: BorderSide(
                color: Color.fromRGBO(127, 151, 46, 1),
                style: BorderStyle.solid,
                width: 1.0,
              ),
              textColor: Color.fromRGBO(127, 151, 46, 1),
            ),
            new OutlineButton(
              child: new Text('Property'),
              onPressed: _searchPropertyBtnClicked,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              borderSide: BorderSide(
                color: Color.fromRGBO(127, 151, 46, 1),
                style: BorderStyle.solid,
                width: 1.0,
              ),
              textColor: Color.fromRGBO(127, 151, 46, 1),
            )
          ],
        ),
      );
  }

  void _searchPersonBtnClicked() {
    Navigator.of(con).pushReplacementNamed('/SearchPersonScreen');
  }
  void _searchPropertyBtnClicked() {

  }
}
