import 'package:flutter/material.dart';
import 'package:opim_flutter/Menus/Login/contract/LoginInterface.dart';
import 'package:opim_flutter/Menus/Login/presenter/LoginPresenter.dart';
import 'package:opim_flutter/Menus/adapter/BottomNavAdapter.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:opim_flutter/Utils/OpimUtils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginInterfaceView{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  TextEditingController etLoginNik = new TextEditingController();
  TextEditingController etLoginPass = new TextEditingController();
  bool _obscureText = true;
  OpimUtils _opimUtils = OpimUtils();
  LoginPresenter _loginPresenter;

  @override
  void initState() {
    super.initState();
    _loginPresenter = LoginPresenter(this);
    _loginPresenter.initLogin();
  }

  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool isSmallScreen = shortestSide < 500.0;
    return Scaffold(body: isSmallScreen ?
          _initViewLogin(context, true)
        : _initViewLogin(context, false)
      ,);
  }

  Widget _initViewLogin(BuildContext context, bool isSmallScreen){
      return Form(
          key: _formKey,
          child: new Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: new Container(
              child: new Center(
                child: new SingleChildScrollView(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        isSmallScreen ? new Padding(padding: EdgeInsets.only(top: 20.0))
                        : new Padding(padding: EdgeInsets.only(top: 30.0)),
                        new Image.asset('assets/images/opim_launcher.png', width: 190, height: 120,),
                        new Text("OPIM",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                        ),
                        new Text("Oil Palm Integrated Management",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 45.0, left: 25.0,right: 25.0),
                          child: TextFormField(
                            controller: etLoginNik,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.account_box),
                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              labelText: "NIK",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(
                                ),
                              ),
                            ),
                            validator: (val) {
                              if(val.length==0) {return "Nik cannot be empty";
                              }else{return null;}
                            },
                            keyboardType: TextInputType.text,
                            maxLength: 15,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 10.0, left: 25.0,right: 25.0, bottom: 50.0),
                          child: TextFormField(
                            controller: etLoginPass,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              labelText: "Password",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(
                                ),
                              ),
                              suffixIcon: IconButton(onPressed: () { _toggle();},
                                icon: Icon(Icons.remove_red_eye),
                              ),
                            ),
                            validator: (val) {
                              if(val.length==0) {return "password cannot be empty";
                              }else{return null;}
                            },
                            obscureText: _obscureText,
                            maxLength: 15,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),

                        // new Padding(padding: EdgeInsets.only(top: 50.0)),
                        new RawMaterialButton(
                          fillColor: Colors.green,
                          splashColor: Colors.green,
                          padding: EdgeInsets.only(left: 140, top:20, right: 140, bottom: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()){
                                _loginPresenter.validateConn(context,etLoginNik.text.trim(), etLoginPass.text.trim());
                            }
                          },
                          child: Text(
                            "MASUK",
                            style: TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 30.0)),
                        new Image.asset('assets/images/ic_bottom.jpeg', width: 120, height: 50,),
                      ],
                  ),
                ),
              ),
            ),
          ),
      );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void goToHome() {
    loadingBar(ConstantsVar.hideLoadingBar);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) => BottomNavAdapter()
        ));
    _loginPresenter.destroyLogin();
  }

  @override
  void loadingBar(int typeLoading) {
    typeLoading == ConstantsVar.showLoadingBar ? OpimUtils.showLoadingDialog(context,_keyLoader, ConstantsVar.loadingMessage)
        : Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
  }

  @override
  void messageLogin(String message) => _opimUtils.toastMessage(message);

  @override
  void onAlertDialog(String titleMsg, String titleContent, BuildContext context)
   => _opimUtils.showNoActionDialog(titleMsg, titleContent, context);

  @override
  void directToHome() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) => BottomNavAdapter()
        ));
  }
}