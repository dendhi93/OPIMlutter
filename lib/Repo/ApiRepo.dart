
import 'package:opim_flutter/Model/response/ResponseLoginModel.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiRepo{

  Future<String> getLogin(String un, String pass) async{
    //post using form data
    String urlPostLogin = ConstantsVar.urlApi+'authenticate';
    print(Uri.parse(urlPostLogin));

    PostLogin _postLogin = PostLogin(username: un,password: pass, imei: "ANDROID");
    print(PostLogin().loginToJson(_postLogin));

    final http.Response responseLogin = await http
        .post(Uri.parse(urlPostLogin),
        headers: {'Content-Type': 'application/json',},
        body: PostLogin().loginToJson(_postLogin)
    ).timeout(Duration(seconds: 100));

    log(responseLogin.body);
    return responseLogin.body;
  }

  Future<String> getAllMasterData(String getToken) async{
    String urlAllMasterData = ConstantsVar.urlApi +'master010/allmaster';
    print(Uri.parse(urlAllMasterData));
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $getToken'
    };

    final http.Response responseAllMaster = await http
        .get(Uri.parse(urlAllMasterData),
        headers: requestHeaders
    ).timeout(Duration(minutes: 30),
        onTimeout: (){
          throw new Exception("time out");
        });

    log(responseAllMaster.body);
    return responseAllMaster.body;
  }

}