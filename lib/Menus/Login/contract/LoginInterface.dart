import 'package:flutter/cupertino.dart';

class LoginInterfaceImpl{
  void submitLogin(String un, String pwd){}
  void destroyLogin(){}
  void initLogin(){}
  void validateConn(BuildContext context,String un, String pwd){}
  void initDatabase(){}
}

class LoginInterfaceView{
  void messageLogin(String message){}
  void onAlertDialog(String titleMsg, String titleContent, BuildContext context){}
  void goToHome(){}
  void loadingBar(int typeLoading){}
}