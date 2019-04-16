import 'package:flutter/material.dart';
import 'SearchPersonScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new OutlineButton(
              child: new Text('Person'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPersonScreen()),
                );
              },
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

  _searchPersonBtnClicked(BuildContext con1) {

  }
  void _searchPropertyBtnClicked() {

  }
}
