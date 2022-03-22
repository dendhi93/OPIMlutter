import 'package:OPIMFlutter/Menus/Login/contract/LoginInterface.dart';
import 'package:OPIMFlutter/Utils/ConstantsVar.dart';
import 'package:OPIMFlutter/Utils/OpimUtils.dart';
import 'package:flutter/cupertino.dart';


class LoginPresenter implements LoginInterfaceImpl{
  LoginInterfaceView view;
  LoginPresenter(this.view);

  @override
  void destroyLogin() => view = null;

  @override
  void initLogin() {
    // TODO: implement initLogin
  }

  @override
  void submitLogin(String un, String pwd) {
    // TODO: implement submitLogin
  }

  @override
  void validateConn(BuildContext context, String un, String pwd) {
    OpimUtils.checkConnection().then((isConnected) => {
      isConnected ? submitLogin(un, pwd) : view?.onAlertDialog(ConstantsVar.noConnectionTitle, ConstantsVar.noConnectionMessage, context)
    });
  }

}