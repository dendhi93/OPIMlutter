import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:opim_flutter/Menus/Account/contract/AccountInterface.dart';
import 'package:opim_flutter/Menus/Account/presenter/AccountPresenter.dart';
import 'package:opim_flutter/Menus/Login/view/Login.dart';
import 'package:opim_flutter/Model/database/entity/MUser.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:opim_flutter/Utils/OpimUtils.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> implements AccountInterfaceView, DialogAction{
  String nameUser = "";
  String nikUser = "";
  String userRole = "";
  String popUser = "";
  String divisionUser = "";
  String imeiUser = "";
  String lastLoginUser = "";
  String registeredDateUser = "";
  String versionApps = "";
  AccountPresenter _accountPresenter;
  OpimUtils _opimUtils = OpimUtils();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _initViewAccount(context),);
  }

  @override
  void initState() {
    super.initState();
    _accountPresenter = AccountPresenter(this);
    _accountPresenter.initViewData();
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
            child: SingleChildScrollView(
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
                      Padding(padding: EdgeInsets.only(top: 50.0)),
                      Image.asset('assets/images/ic_user.png', width: 90, height: 80,),
                      Padding(padding: EdgeInsets.only(top: 23.0)),
                      Text(nameUser, style:TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(top: 14.0)),
                      Text(nikUser, style:TextStyle(fontSize: 15, color: Colors.white)),
                      Padding(padding: EdgeInsets.only(top: 18.0)),
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
                          child: Text(userRole, style:TextStyle(fontSize: 15, color: Colors.white)),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 22.0)),
                      Text(versionApps, style:TextStyle(fontSize: 15, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
        ),flex: 3,),
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
                imeiColumn,
                lastLoginColumn,
                registerDateColumn,
                Padding(padding: EdgeInsets.only(top: 10.0)),
                GestureDetector(
                    onTap: (){
                        _opimUtils.showYesNoActionDialog("Confirmation","Are you sure wanto to exit application ?", context, this);
                      },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                      Row(
                            children: <Widget>[
                              Image.asset('assets/images/ic_logout.png', width: 50, height: 30,),
                              Text('Keluar ', style:TextStyle(fontSize: 14, color: Colors.black)),
                            ],
                        ),
                      ],
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
        child: Text('POP ', style:TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text(popUser, style:TextStyle(fontSize: 14, color: Colors.black)),
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
        child: Text('Divisi ', style:TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text(divisionUser, style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Divider(color: Colors.black, height: 1),
    ],
  );

  get imeiColumn => Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text('IMEI ', style:TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text(imeiUser, style:TextStyle(fontSize: 14, color: Colors.black)),
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
        child: Text('Terakhir Login ', style:TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text(lastLoginUser, style:TextStyle(fontSize: 14, color: Colors.black)),
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
        child: Text('Tanggal Registrasi ', style:TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Container(
        alignment: Alignment.topLeft,
        child: Text(registeredDateUser, style:TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Divider(color: Colors.black, height: 1),
    ],
  );

  @override
  void resultUserView(MUser mUser) {
    setState(() {
      userRole = mUser.roleName;
      nameUser = mUser.firstName + " " + mUser.lastName;
      nikUser = "Kode Pengguna : " +mUser.nik;
      popUser = mUser.pop;
      divisionUser = mUser.division;
      lastLoginUser = _opimUtils.dateChangeFormat(mUser.lastLoggedIn, ConstantsVar.slashDateTimeFormat);
      registeredDateUser = _opimUtils.dateChangeFormat(mUser.registrationDate, ConstantsVar.slashDateFormat);
      imeiUser = mUser.imei;
    });
    }

  @override
  void resultVersion(String version) {
    setState(() {versionApps = version;});
  }

  @override
  void noAction() {}

  @override
  void yesAction() {
    _accountPresenter.logoutProcess();
  }

  @override
  void goToLogin() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) => Login()
        ));
    _accountPresenter.destroyAccountView();
  }
}