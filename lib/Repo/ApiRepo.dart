
import 'package:opim_flutter/Model/response/ResponseLoginModel.dart';
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:http/http.dart' as http;

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
    ).timeout(Duration(seconds: 50));

    print(responseLogin.body);
    return responseLogin.body;
  }
}