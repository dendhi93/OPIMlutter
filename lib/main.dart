
import 'package:flutter/material.dart';
import 'Menus/Splash/Splash.dart';

void main() {
  runApp(OPIMApp());
}

class OPIMApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OPIM',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
