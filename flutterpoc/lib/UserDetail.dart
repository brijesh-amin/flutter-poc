import 'package:flutter/material.dart';
import 'Api_bloc.dart';
import 'ApiProvider.dart';

class UserDetail extends StatefulWidget {
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
   @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.getUser,
      builder: (context, snapshot) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
    );
  }
}
