
import 'package:OPIMFlutter/Menus/Login/contract/LoginInterface.dart';
import 'package:OPIMFlutter/Menus/Login/presenter/LoginPresenter.dart';
import 'package:OPIMFlutter/Utils/ConstantsVar.dart';
import 'package:OPIMFlutter/Utils/OpimUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // _loginPresenter.initLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _initViewLogin(context),);
  }

  Widget _initViewLogin(BuildContext context){
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
                        new Image.asset('assets/images/opim_launcher.png', width: 190, height: 120,),
                        new Text("OPIM",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                        ),
                        new Text("Oil Palm Integrated Management",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                        ),
                        new Padding(padding: EdgeInsets.only(top: 45.0)),
                        new TextFormField(
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
                        new Padding(padding: EdgeInsets.only(top: 10.0)),
                        new TextFormField(
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
                        new Padding(padding: EdgeInsets.only(top: 50.0)),
                        new RawMaterialButton(
                          fillColor: Colors.green,
                          splashColor: Colors.green,
                          padding: EdgeInsets.only(left: 120, top:20, right: 120, bottom: 20),
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
    // TODO: implement goToHome
  }

  @override
  void loadingBar(int typeLoading) {
    typeLoading == ConstantsVar.showLoadingBar ? OpimUtils.showLoadingDialog(context,_keyLoader, ConstantsVar.loadingMessage)
        : Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
  }

  @override
  void messageLogin(String message) {
    // TODO: implement messageLogin
  }

  @override
  void onAlertDialog(String titleMsg, String titleContent, BuildContext context)
   => _opimUtils.showNoActionDialog(titleMsg, titleContent, context);

}