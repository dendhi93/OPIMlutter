
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:opim_flutter/Menus/Login/contract/LoginInterface.dart';
import 'package:opim_flutter/Model/database/entity/MAncak.dart';
import 'package:opim_flutter/Model/database/entity/MBlock.dart';
import 'package:opim_flutter/Model/database/entity/MTph.dart';
import 'package:opim_flutter/Model/database/entity/MUser.dart';
import 'package:opim_flutter/Model/database/entity/Mdivisi.dart';
import 'package:opim_flutter/Model/response/ResponseLoginModel.dart';
import 'package:opim_flutter/Model/response/ResponseMasterData.dart';
import 'package:opim_flutter/Repo/ApiRepo.dart';
import 'package:opim_flutter/Repo/MasterRepo.dart';
import 'package:opim_flutter/Repo/UserRepo.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:opim_flutter/Utils/OpimUtils.dart';
import 'package:intl/intl.dart';
import 'package:opim_flutter/Model/database/AppDatabase.dart';

class LoginPresenter implements LoginInterfaceImpl{
  LoginInterfaceView view;
  LoginPresenter(this.view);
  final database = $FloorAppDatabase.databaseBuilder('opim_database.db').build();
  ApiRepo _apiRepo = ApiRepo();
  UserRepo _userRepo = UserRepo();
  MasterRepo _masterRepo = MasterRepo();
  String responseLoginStatus = "";
  String responseStatusAllMaster = "";
  String userToken = "";
  DateTime now = DateTime.now();
  MUser mUser;

  @override
  void destroyLogin() => view = null;

  @override
  void initLogin() {
    _userRepo.initUserRepo();
    database.then((onValueDb) {
      onValueDb.userDAO.findAllUser().then((onValueQuery) => {
          if(onValueQuery != null){
            if(onValueQuery.length > 0){
              userToken = onValueQuery[0].userToken,
              if(userToken != "")view?.directToHome(),
            }
          }
      });
    });
  }

  @override
  void submitLogin(String un, String pwd) {
    //todo request api
    view?.loadingBar(ConstantsVar.showLoadingBar);
    try{
      String firstName, lastName, roleName, roleCode, lastLoggedIn, registrationDate, popId, nikUser;
      String popName, division, imei, lastUpload, lastSync, companyCode, passwordUser;
      int maxId = 1;
      MUser mUser;

      _apiRepo.getLogin(un.trim(), pwd.trim()).then((value) => {
        responseLoginStatus = ResponseLoginModel.fromJson(jsonDecode(value)).status,
        if(responseLoginStatus == ConstantsVar.successStatusCode){
            nikUser = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.usercode,
            firstName = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.firstname,
            lastName = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.lastname,
            roleName = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.roledescname,
            roleCode = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.rolecode,
            registrationDate = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.registrationDate,
            popId = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.popcode,
            popName = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.popname,
            division = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.divisicode,
            imei = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.refDevicecode,
            lastUpload = new DateFormat(ConstantsVar.yearStripDateTimeFormat).format(now),
            lastSync = new DateFormat(ConstantsVar.yearStripDateTimeFormat).format(now),
            lastLoggedIn = new DateFormat(ConstantsVar.yearStripDateTimeFormat).format(now),
            userToken = ResponseLoginModel.fromJson(jsonDecode(value)).data.token,
            companyCode = ResponseLoginModel.fromJson(jsonDecode(value)).data.userProfile.refCompanycode,
            passwordUser = pwd.trim(),

            database.then((onValueDB) {
              onValueDB.userDAO.getMaxUser().then((onValueMax) => {
                if(onValueMax != null){maxId = onValueMax.id + 1}
              });
              mUser = MUser(maxId, nikUser,firstName, lastName, roleName, roleCode, lastLoggedIn, registrationDate, popId, popName, division, imei, lastUpload, lastSync, true, userToken, companyCode, passwordUser);
              _userRepo.insertUser(mUser);

              getAllMaster();
            }),
        }else if(responseLoginStatus == ConstantsVar.failedStatusCode){
          view?.messageLogin(ResponseLoginModel.fromJson(jsonDecode(value)).message)
        }else if(responseLoginStatus == ConstantsVar.errorStatusCode){
          view?.messageLogin(ConstantsVar.errorStatusMessage)
        },
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

  void getAllMaster() {
    MBlock mBlock;
    MDivisi mDivisi;
    MAncak mAncak;
    MTph mTph;
    List<Block> listResponseBlock = [];
    List<Divisi> listResponseDivision = [];
    List<Ancak> listResponseAncak = [];
    List<Tph> listResponseTph = [];
    _masterRepo.initMasterRepo();

    _apiRepo.getAllMasterData(userToken).then((value) async => {
      responseStatusAllMaster = ResponseMasterData.fromJson(jsonDecode(value)).status,
      if(responseStatusAllMaster == ConstantsVar.successStringStatus){
        //put all master in here
        listResponseBlock = ResponseMasterData.fromJson(jsonDecode(value)).data.block,
        listResponseDivision = ResponseMasterData.fromJson(jsonDecode(value)).data.divisi,
        listResponseAncak = ResponseMasterData.fromJson(jsonDecode(value)).data.ancak,
        listResponseTph = ResponseMasterData.fromJson(jsonDecode(value)).data.tph,

        if(listResponseBlock != null){
          for(final block in listResponseBlock){
            mBlock = MBlock(block.blockid, block.refDivisiId.toString(), block.blokdescname, block.divisicode, block.companycode, block.popcode, block.blockcode),
            _masterRepo.insertBlock(mBlock)
          },
        },

        if(listResponseDivision != null){
            for(final division in listResponseDivision){
                mDivisi = MDivisi(division.divisiId, division.divisiDescname, division.divisicode, division.refPopcode),
                _masterRepo.insertDivision(mDivisi)
            }
          },

        if(listResponseAncak != null){
          for(final ancak in listResponseAncak){
            mAncak = MAncak(ancak.ancakid, ancak.refBlockid.toString(), ancak.ancakDescname, ancak.blockcode, ancak.popcode, ancak.divisicode, ancak.ancakcode),
            _masterRepo.insertAncak(mAncak)
          }
        },

        if(listResponseTph != null){
          for(final tph in listResponseTph){
            mTph = MTph(tph.tphId, tph.refAncakid.toString(), tph.tphDescname, tph.longitude, tph.latitude, tph.ancakcode, tph.popcode, tph.divisicode, tph.tphcode, tph.blockcode, tph.tphIntegrityCode),
            _masterRepo.insertTph(mTph)
          }
        },
        await new Future.delayed(const Duration(seconds: 5), () {
          view?.goToHome();
        }),
      }
    });
  }

}