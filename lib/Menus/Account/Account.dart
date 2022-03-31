import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _initViewAccount(context),);
  }

  Widget _initViewAccount(BuildContext context){
    return Form(
      child: new Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(left: 70.0, top: 40.0)),
          new Text("account",style:TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}