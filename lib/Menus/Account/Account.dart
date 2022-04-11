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
    return Stack(
      children: <Widget>[dashAccount, content],
    );
  }

  get dashAccount => Column(
      children: <Widget>[
        Expanded(child: Container(
          color: Colors.green,
        ),flex: 3,),
        Expanded(child: Container(
          color: Colors.white,
        ),flex: 4,),
      ],
  );

  get content => Container(

  );
}