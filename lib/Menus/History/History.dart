import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _initViewHistory(context),);
  }

  Widget _initViewHistory(BuildContext context){
    return Form(
      child: new Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(left: 70.0, top: 40.0)),
          new Text("history",style:TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}