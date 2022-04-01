import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{


  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool isSmallScreen = shortestSide < 500.0;
    return Scaffold(body: isSmallScreen ?
        _initViewHome(context, true)
        : _initViewHome(context, false)
    ,);
  }

  Widget _initViewHome(BuildContext context, bool isSmallScreen){
    return Stack(
      children: <Widget>[dashBg, content],
    );
  }

  get dashBg => Column(
    children: <Widget>[
      Expanded(child: Container(
          color: Colors.green,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 30.0, top: 40.0),
                                child: Text('Selamat Bekerja', style:TextStyle(fontSize: 18, color: Colors.white)),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 30.0, top: 7.0),
                                child: Text('Nama', style:TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(child:
                  Container(
                    margin: EdgeInsets.only(top: 0.0, left: 30.0,right: 30.0, bottom: 60.0),
                    child: Divider(color: Colors.white),
                  )
              ),
            ],
          ),
      ),flex: 3,),
      Expanded(child: Container(color: Colors.transparent),flex: 5,),
    ],
  );

  get content => Container(
    margin: EdgeInsets.only(top: 125.0, left: 30.0,right: 30.0, bottom: 170.0),
    decoration: new BoxDecoration(
        color: HexColor("#E5E4E2"),
        borderRadius: new BorderRadius.only(
            topLeft:  const  Radius.circular(15.0),
            topRight: const  Radius.circular(15.0),
            bottomLeft:  const  Radius.circular(15.0),
            bottomRight: const  Radius.circular(15.0))
    ),
    child: Center(child: Text('')),
  );

}