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
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ic_tse_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(top: 30.0)),
                  Center(
                    child: Image.asset('assets/images/ic_user.png', width: 190, height: 120,),
                  )
                ],
              ),
            ),
        ),flex: 3,),
        Expanded(child: Container(
          color: Colors.white,
        ),flex: 4,),
      ],
  );

  get content => Container(

  );
}