import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  String nameUser = "";
  String popUser = "";

  @override
  void initState() {
    super.initState();
    nameUser = "Budi";
    popUser = "TSE - A";
  }

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
                                padding: const EdgeInsets.only(left: 25.0, top: 40.0),
                                child: Text('Selamat Bekerja', style:TextStyle(fontSize: 18, color: Colors.white)),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 25.0, top: 7.0),
                                child: Text(nameUser, style:TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                          ],
                        ),
                      ),
                    Expanded(child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 17.0),
                            child: Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                                size: 45,
                              ),
                            ),
                          new Padding(padding: EdgeInsets.only(right: 10.0)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(right: 25.0, top: 40.0),
                                child: Text('POP', style:TextStyle(fontSize: 18, color: Colors.white)),
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 25.0, top: 7.0),
                                child: Text(popUser, style:TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),

                  Container(
                    margin: EdgeInsets.only(top: 0.0, left: 25.0,right: 25.0, bottom: 127.0),
                    child: Divider(
                        color: Colors.white,
                        height: 2
                    ),
              ),
            ],
          ),
      ),flex: 3,),
      Expanded(child: Container(color: Colors.transparent),flex: 5,),
    ],
  );

  get content => Container(
    padding: const EdgeInsets.all(12.0),
    margin: EdgeInsets.only(top: 120.0, left: 25.0,right: 25.0, bottom: 183.0),
    decoration: new BoxDecoration(
        color: HexColor("#F0F8FF"),
        borderRadius: new BorderRadius.only(
            topLeft:  const  Radius.circular(15.0),
            topRight: const  Radius.circular(15.0),
            bottomLeft:  const  Radius.circular(15.0),
            bottomRight: const  Radius.circular(15.0)
        ),
      boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(2, 3),
          )
      ],
    ),
    child: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Informasi', style:TextStyle(fontSize: 18, color: Colors.black)),
              Text('Informasi terbaru untukmu ada disini', style:TextStyle(fontSize: 15, color: Colors.black)),
              new Padding(padding: EdgeInsets.only(top: 5.0)),
              listRestan,
              new Padding(padding: EdgeInsets.only(top: 5.0)),
              listLastLogin,
              new Padding(padding: EdgeInsets.only(top: 5.0)),
              listLastUploaded,
              new Padding(padding: EdgeInsets.only(top: 5.0)),
              listLastSync
            ],
          ),
        )
    ),
  );

  get listRestan => Container(
    padding: const EdgeInsets.all(12.0),
    decoration: new BoxDecoration(
      color: HexColor("#FDEEEE"),
      borderRadius: new BorderRadius.only(
          topLeft:  const  Radius.circular(15.0),
          topRight: const  Radius.circular(15.0),
          bottomLeft:  const  Radius.circular(15.0),
          bottomRight: const  Radius.circular(15.0)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 1,
          offset: Offset(2, 3),
        )
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Detail Restan', style:TextStyle(fontSize: 15, color: Colors.black)),
            Row(
              children: [
                Icon(
                  Icons.circle_notifications,
                  color: Colors.grey,
                ),
                new Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('TPH belum di cek')
              ],
            )
          ],
        )
        ),
        Icon(
          Icons.circle_notifications,
          color: Colors.grey.withOpacity(0.9),
          size: 32,
        ),
      ],
    ),
  );

  get listLastLogin => Container(
    padding: const EdgeInsets.all(8.0),
    decoration: new BoxDecoration(
      color: HexColor("#FDF7E5"),
      borderRadius: new BorderRadius.only(
          topLeft:  const  Radius.circular(15.0),
          topRight: const  Radius.circular(15.0),
          bottomLeft:  const  Radius.circular(15.0),
          bottomRight: const  Radius.circular(15.0)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 1,
          offset: Offset(2, 3),
        )
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Last Login', style:TextStyle(fontSize: 15, color: Colors.black)),
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: Colors.grey,
                ),
                new Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('dd/mm/yyyy')
              ],
            )
          ],
        )
        ),
        Icon(
          Icons.account_circle_outlined,
          color: Colors.grey.withOpacity(0.9),
          size: 32,
        ),
      ],
    ),
  );

  get listLastUploaded => Container(
    padding: const EdgeInsets.all(8.0),
    decoration: new BoxDecoration(
      color: HexColor("#FDF7E5"),
      borderRadius: new BorderRadius.only(
          topLeft:  const  Radius.circular(15.0),
          topRight: const  Radius.circular(15.0),
          bottomLeft:  const  Radius.circular(15.0),
          bottomRight: const  Radius.circular(15.0)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 1,
          offset: Offset(2, 3),
        )
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Last Uploaded', style:TextStyle(fontSize: 15, color: Colors.black)),
            Row(
              children: [
                Icon(
                  Icons.arrow_circle_up_outlined,
                  color: Colors.grey,
                ),
                new Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('dd/mm/yyyy')
              ],
            )
          ],
        )
        ),
        Icon(
          Icons.arrow_circle_up_outlined,
          color: Colors.grey.withOpacity(0.9),
          size: 32,
        ),
      ],
    ),
  );

  get listLastSync => Container(
    padding: const EdgeInsets.all(8.0),
    decoration: new BoxDecoration(
      color: HexColor("#FDF7E5"),
      borderRadius: new BorderRadius.only(
          topLeft:  const  Radius.circular(15.0),
          topRight: const  Radius.circular(15.0),
          bottomLeft:  const  Radius.circular(15.0),
          bottomRight: const  Radius.circular(15.0)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 1,
          offset: Offset(2, 3),
        )
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Last Synchronization', style:TextStyle(fontSize: 15, color: Colors.black)),
            Row(
              children: [
                Icon(
                  Icons.sync,
                  color: Colors.grey,
                ),
                new Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('dd/mm/yyyy')
              ],
            )
          ],
        )
        ),
        Icon(
          Icons.sync,
          color: Colors.grey.withOpacity(0.9),
          size: 32,
        ),
      ],
    ),
  );

}