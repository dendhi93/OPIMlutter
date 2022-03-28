
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:opim_flutter/Menus/Login/contract/LoginInterface.dart';
import 'package:opim_flutter/Model/MUserDao.dart';
import 'package:opim_flutter/Model/database/AppDatabase.dart';
import 'package:opim_flutter/Model/response/ResponseLoginModel.dart';
import 'package:opim_flutter/Repo/ApiRepo.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:opim_flutter/Utils/OpimUtils.dart';

class LoginPresenter implements LoginInterfaceImpl{
  LoginInterfaceView view;
  LoginPresenter(this.view);
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();
  ApiRepo _apiRepo = ApiRepo();
  String responseStatus = "";

  @override
  void destroyLogin() => view = null;

  @override
  void initLogin() {
    //todo validate already login
  }

  @override
  void submitLogin(String un, String pwd) {
    //todo request api
    view?.loadingBar(ConstantsVar.showLoadingBar);
    _apiRepo.getLogin(un.trim(), pwd.trim()).then((value) => {
        responseStatus = ResponseLoginModel.fromJson(jsonDecode(value)).status,
        view?.loadingBar(ConstantsVar.hideLoadingBar),
        if(responseStatus == ConstantsVar.successStatusCode){
          view?.messageLogin("Sucess")
        }else if(responseStatus == ConstantsVar.failedStatusCode){
          view?.messageLogin(ResponseLoginModel.fromJson(jsonDecode(value)).message)
        }else if(responseStatus == ConstantsVar.errorStatusCode){
          view?.messageLogin(ConstantsVar.errorStatusMessage)
        }
    });
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