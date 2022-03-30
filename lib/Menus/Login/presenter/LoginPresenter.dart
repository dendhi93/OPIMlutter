
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:opim_flutter/Menus/Login/contract/LoginInterface.dart';
import 'package:opim_flutter/Model/database/AppDatabase.dart';
import 'package:opim_flutter/Model/database/entity/MUser.dart';
import 'package:opim_flutter/Model/response/ResponseLoginModel.dart';
import 'package:opim_flutter/Repo/ApiRepo.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:opim_flutter/Utils/OpimUtils.dart';
import 'package:intl/intl.dart';

class LoginPresenter implements LoginInterfaceImpl{
  LoginInterfaceView view;
  LoginPresenter(this.view);
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();
  ApiRepo _apiRepo = ApiRepo();
  String responseStatus = "";
  String firstName, lastName, roleName, roleCode, lastLoggedIn, registrationDate, popId;
  String popName, division, imei, lastUpload, lastSync, userToken, companyCode, passwordUser;
  MUser mUser;
  int maxId = 0;
  DateTime now = DateTime.now();

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
    int id = 1;
    try{
      _apiRepo.getLogin(un.trim(), pwd.trim()).then((value) => {
        responseStatus = ResponseLoginModel.fromJson(jsonDecode(value)).status,
        view?.loadingBar(ConstantsVar.hideLoadingBar),
        if(responseStatus == ConstantsVar.successStatusCode){
          view?.messageLogin("Success"),
          firstName = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.firstname,
          lastName = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.lastname,
          roleName = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.roledescname,
          roleCode = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.rolecode,
          registrationDate = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.registrationDate,
          popId = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.popcode,
          popName = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.popname,
          division = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.divisicode,
          imei = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.refDevicecode,
          lastUpload = new DateFormat('yyyy-MM-dd HH:mm:ss').format(now),
          lastSync = new DateFormat('yyyy-MM-dd HH:mm:ss').format(now),
          lastLoggedIn = new DateFormat('yyyy-MM-dd HH:mm:ss').format(now),
          userToken = ResponseLoginModel.fromJson(jsonDecode(value)).data.token,
          companyCode = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.refCompanycode,
          passwordUser = pwd.trim(),
          database.then((onValueP) {
            onValueP.userDAO.getMaxUser().then((onValueMax) => {
                if(onValueMax != null){
                    id = onValueMax.id + 1
                }
            });
            mUser = MUser(id, firstName, lastName, roleName, roleCode, lastLoggedIn, registrationDate, popId, popName, division, imei, lastUpload, lastSync, true, userToken, companyCode, passwordUser);
            onValueP.userDAO.insertUser(mUser);
            view?.goToHome();
          }),
          // view?.goToHome(),
        }else if(responseStatus == ConstantsVar.failedStatusCode){
          view?.messageLogin(ResponseLoginModel.fromJson(jsonDecode(value)).message)
        }else if(responseStatus == ConstantsVar.errorStatusCode){
          view?.messageLogin(ConstantsVar.errorStatusMessage)
        }
      });
    }catch(error){
      view?.loadingBar(ConstantsVar.hideLoadingBar);
      view?.messageLogin("error Login $error");
    }
  }

  @override
  void validateConn(BuildContext context, String un, String pwd) {
    OpimUtils.checkConnection().then((isConnected) => {
      isConnected ? submitLogin(un, pwd) : view?.onAlertDialog(ConstantsVar.noConnectionTitle, ConstantsVar.noConnectionMessage, context)
    });
  }
}