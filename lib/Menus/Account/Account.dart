import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
      children: <Widget>[dashAccount],
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
              child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 60.0)),
                      Image.asset('assets/images/ic_user.png', width: 90, height: 80,),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text('Selamat Bekerja', style:TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text('Kode Pengguna : 20105695', style:TextStyle(fontSize: 15, color: Colors.white)),
                      Padding(padding: EdgeInsets.only(top: 14.0)),
                      Container(
                        width: 130,
                        height: 28,
                        decoration: new BoxDecoration(
                          color: HexColor("#99C68E"),
                          borderRadius: new BorderRadius.only(
                              topLeft:  const  Radius.circular(10.0),
                              topRight: const  Radius.circular(10.0),
                              bottomLeft:  const  Radius.circular(10.0),
                              bottomRight: const  Radius.circular(10.0)
                          ),
                        ),
                        child: Center(
                          child: Text('Checker Panen', style:TextStyle(fontSize: 15, color: Colors.white)),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      Text('Versi : 1.3.0 ', style:TextStyle(fontSize: 15, color: Colors.white)),
                    ],
                  ),
              ),
            ),
        ),flex: 4,),
        Expanded(child: Container(
          alignment: Alignment.topLeft,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SingleChildScrollView(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                popColumn,
                divisionColumn,
                nikColumn,
                imeiColumn,
                lastLoginColumn,
                registerDateColumn,
                Padding(padding: EdgeInsets.only(top: 20.0)),
                GestureDetector(
                  onTap: (){ print("coba");},
                  child: Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Image.asset('assets/images/ic_logout.png', width: 50, height: 30,),
                        Text('Keluar ', style:TextStyle(fontSize: 14, color: Colors.black)),
                      ],
                    ),
                  )
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0)),
              ],
            ),
          )
        ),flex: 4,),
      ],
  );

  get popColumn => Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('POP ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('POP A ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Divider(color: HexColor("#D1D1D1"), height: 1),
    ],
  );

  get divisionColumn => Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('Divisi ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('POP A ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Divider(color: Colors.black, height: 1),
    ],
  );

  get nikColumn => Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('NIK ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('POP A ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Divider(color: HexColor("#D1D1D1"), height: 1),
    ],
  );

  get imeiColumn => Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('IMEI ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('POP A ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Divider(color: Colors.black, height: 1),
    ],
  );

  get lastLoginColumn => Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('Terakhir Login ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('POP A ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Divider(color: HexColor("#D1D1D1"), height: 1),
    ],
  );

  get registerDateColumn => Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('Tanggal Registrasi ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('POP A ', style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Divider(color: Colors.black, height: 1),
    ],
  );
}