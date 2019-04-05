import 'package:flutter/material.dart';
import 'Api_bloc.dart';
import 'HomeScreen.dart';
import 'UserDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color.fromRGBO(127, 151, 46, 1),
      ),
      home: MyHomePage(title: 'CASTLETON'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _strServiceURL = new TextEditingController();
  TextEditingController _strEmailAddress = new TextEditingController();
  TextEditingController _strPassword = new TextEditingController();

  //set initial value
  @override
  void initState() {
    super.initState();
    _strServiceURL.text = 'https://dev.365agile.com/365agile.mobile.service.dev/';
    _strEmailAddress.text = 'Kandarp.Pathak';
    _strPassword.text = '6H?S7\$LguT';
  }

  String _serviceURL = '';
  String _email = '';
  String _password = '';

  _MyHomePageState() {
    _strServiceURL.addListener(_serviceURLListen);
    _strEmailAddress.addListener(_emailListen);
    _strPassword.addListener(_passwordListen);
  }

//Reflect textfield edited value
  void _serviceURLListen() {
    if(_strServiceURL.text.isEmpty){
      _serviceURL = '';
    } else {
      _serviceURL =_strServiceURL.text;
    }
  }

  void _emailListen() {
    if(_strEmailAddress.text.isEmpty){
      _email = '';
    } else {
      _email =_strEmailAddress.text;
    }
  }

  void _passwordListen() {
    if(_strPassword.text.isEmpty){
      _password = '';
    } else {
      _password =_strPassword.text;
    }
  }

  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void _getUserDetail() {
    String imei = '65323BFD-F232-4CD9-834E-742F9A3E6A33';
    String accessToken = 'tW+j6Xni9JtXvaDatq64K0vbAvuAFdHFQGq31o/zjKs=';
    String dateTime = '2019-02-04T16:01:20';
    bloc.fetchUserDetail(imei, accessToken, dateTime);
  }

  void _staffValidation() {
    String imei = 'BF2B52B3-52C6-4CF8-B446-619A96344FAD';
    String devicetoken = 'PeLocAXvcl5CmME+jvQeX8Uhmqaj6P/WZTviGI42YcE=';
    String emailAddress = _email;
    String password = _password;
    String dateTime = '2019-03-27T14:18:15';
    bloc.validateStaff(imei, devicetoken, dateTime, emailAddress, password);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      //body: UserDetail(),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child:StreamBuilder(
          stream: bloc.validateUser,
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData){
              return _moveToHomeScreen();
            }
            return Column(
              children: <Widget>[
                _createInputFields(),
                _createRegisterButton(),
              ],
            );
          }
        ),
        // child: new Column(
        //   children: <Widget>[
        //     _createInputFields(),
        //     _createRegisterButton(),
        //   ],
        // ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: _getUserDetail,
      //   onPressed: _staffValidation,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
    // return StreamBuilder(
    //   stream: bloc.validateUser,
    //   builder: (context, snapshot) => Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Text(
    //               '${snapshot.data}',
    //               style: Theme.of(context).textTheme.display1,
    //             ),
    //           ],
    //         ),
    //       ),
    // );
  }

  Widget _createInputFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _strServiceURL,
              decoration: new InputDecoration(
                labelText: 'Service URL'
              ),
            )
          ),
          new Container(
            child: new TextField(
              controller: _strEmailAddress,
              decoration: new InputDecoration(
                labelText: 'Email'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _strPassword,
              decoration: new InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _createRegisterButton() {
    return new Container(
      padding: EdgeInsets.only(top: 40.0),
      alignment: Alignment.topRight,
      child: new Column(
        children: <Widget>[
          new OutlineButton(
            child: new Text('Register'),
            onPressed: _registerButtonClicked,
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

  void _registerButtonClicked() {
    print('inside register button $_email, $_password, $_serviceURL');
    _staffValidation();
  }
  Widget _moveToHomeScreen ()  {
    return HomeScreen();
  }
}
