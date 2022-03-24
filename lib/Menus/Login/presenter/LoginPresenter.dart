
import 'package:flutter/cupertino.dart';
import 'package:opim_flutter/Menus/Login/contract/LoginInterface.dart';
import 'package:opim_flutter/Model/MUserDao.dart';
import 'package:opim_flutter/Model/database/AppDatabase.dart';
import 'package:opim_flutter/Model/entity/MUser.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:opim_flutter/Utils/OpimUtils.dart';

class LoginPresenter implements LoginInterfaceImpl{
  LoginInterfaceView view;
  LoginPresenter(this.view);
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();

  @override
  void destroyLogin() => view = null;

  @override
  void initLogin() {
    //todo validate already login
  }

  @override
  void submitLogin(String un, String pwd) {
    //todo request api
    // database.then((onValueP) {
    //
    //   // onValueP.userDAO.insertUser(MUser("aa"))
    // });
  }

  @override
  void validateConn(BuildContext context, String un, String pwd) {
    OpimUtils.checkConnection().then((isConnected) => {
      isConnected ? submitLogin(un, pwd) : view?.onAlertDialog(ConstantsVar.noConnectionTitle, ConstantsVar.noConnectionMessage, context)
    });
  }
}