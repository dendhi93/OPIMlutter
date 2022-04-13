
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:opim_flutter/Menus/Home/contract/HomeInterface.dart';
import 'package:opim_flutter/Menus/Home/presenter/HomePresenter.dart';
import 'package:opim_flutter/Model/database/entity/MUser.dart';
import 'package:opim_flutter/Utils/OpimUtils.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> implements HomeInterfaceView{
  String nameUser = "";
  String popUser = "";
  String qtyTph = "";
  String lastLogin = "";
  String lastUploaded = "";
  String lastSync = "";
  List menus = [];
  OpimUtils _opimUtils = OpimUtils();
  HomePresenter _homePresenter;

  @override
  void initState() {
    super.initState();
    _homePresenter = HomePresenter(this);
    _homePresenter.initViewData();
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
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ic_tse_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
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
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 65.0, bottom: 17.0),
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
                  child: Divider(color: Colors.white, height: 2),
                ),
              ],
            ),
          ),
      ),flex: 3,),
      Expanded(child: Container(
          margin: EdgeInsets.only(left: 30.0,right: 30.0, bottom: 5.0),
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 230.0)),
              Text('Pilih Menu', style:TextStyle(fontSize: 18, color: Colors.black)),
              Padding(padding: EdgeInsets.only(top: 5.0)),
              Expanded(child:
                    Container(child:
                        GridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 4.0,
                          children: [
                            ...menus.map((i) =>
                                GestureDetector(
                                  onTap: (){
                                    _opimUtils.toastMessage("tekan " +i.last.toString());
                                  },
                                  child: Card(
                                        color:  i.last.toString() == "Cek Hasil Panen" ?
                                        HexColor("#2F80ED") : HexColor("#A9A9A9"),
                                        child: Center(child: Column(
                                          children: <Widget>[
                                            Expanded(child: Image.asset(i.first, height: 50,width: 50,)),
                                            Text(i.last, style:TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold)),
                                            Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                          ],
                                         ),
                                        ),
                                  ),
                                )
                            )
                          ],
                        ),
                    ),flex:1,
              ),
            ],
          ),
      ),flex: 5,),
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
              Padding(padding: EdgeInsets.only(top: 5.0)),
              listRestan,
              Padding(padding: EdgeInsets.only(top: 5.0)),
              listLastLogin,
              Padding(padding: EdgeInsets.only(top: 5.0)),
              listLastUploaded,
              Padding(padding: EdgeInsets.only(top: 5.0)),
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
                Text(qtyTph)
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
                Text(lastLogin)
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
                Text(lastUploaded)
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
                Text(lastSync)
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

  @override
  void goToMenu(String menuName) {
    // TODO: implement goToMenu
  }

  @override
  void resultView(MUser mUser) {
    if(mUser != null){
      setState(() {
        nameUser = mUser != null ?
        mUser.firstName + " " +mUser.lastName : "" ;
        popUser = mUser != null ? mUser.pop : "" ;
        lastLogin = mUser != null ? _opimUtils.dateChangeFormat(
            mUser.lastLoggedIn, ConstantsVar.slashDateTimeFormat) : "";
        lastUploaded = mUser != null ? _opimUtils.dateChangeFormat(
            mUser.lastUpload, ConstantsVar.slashDateTimeFormat) : "";
        lastSync = mUser != null ? _opimUtils.dateChangeFormat(
            mUser.lastSync, ConstantsVar.slashDateTimeFormat) : "";
        qtyTph = "5 TPH belum di cek";
        if(mUser != null && mUser.roleCode == "CHECKER_PANEN") {
            menus = [
              ["assets/images/ic_panen.png", "Cek Hasil Panen"],
              ["assets/images/ic_restan.png", "Cek Restan"],
              ["assets/images/ic_street.png", "Lapor Kondisi Jalan"],
              ["assets/images/ic_street.png", "Lapor Kondisi Blok"],
            ];
        }
      });
    }
  }
}


