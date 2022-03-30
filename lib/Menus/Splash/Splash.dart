import 'dart:async';

import 'package:flutter/material.dart';

import '../Login/view/Login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => Login())
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _initViewSplash(context),);
  }

  Widget _initViewSplash(BuildContext context){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset('assets/images/logo_splash.png', width: 190, height: 120,),
            new Image.asset('assets/images/opim_splash.png', width: 120, height: 120,),
          ],
        ),
      );
  }
}