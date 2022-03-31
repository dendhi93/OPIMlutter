

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _initViewHome(context),);
  }

  Widget _initViewHome(BuildContext context){
    return Form(
      child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(left: 60.0, top: 40.0)),
              new Text("home",style:TextStyle(fontSize: 18)),
          ],
      ),
    );
  }

}