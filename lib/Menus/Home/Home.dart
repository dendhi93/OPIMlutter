

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
            new Padding(padding: EdgeInsets.only(top: 40.0)),
            new Stack(
                children: <Widget>[
                  new Image.asset('assets/images/opim_launcher.png', width: 290, height: 220,),
                  new Padding(padding: EdgeInsets.only(top: 90.0)),
                  new Text("home",style:TextStyle(fontSize: 18)),
                ],
            ),
          ],
      ),
    );
  }

}