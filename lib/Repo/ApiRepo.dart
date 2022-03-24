
import 'package:opim_flutter/Utils/ConstantsVar.dart';
import 'package:http/http.dart' as http;

class ApiRepo{

  Future<String> getLogin(String un, String pass) async{
    //post using form data
    print(Uri.parse(ConstantsVar.urlApi+'loginUser.php'));
    var map = new Map<String, dynamic>();
    map['username'] = un;
    map['password'] = pass;
    map['imei'] = "ANDROID";
    final http.Response responseLogin = await http.post(Uri.parse(ConstantsVar.urlApi+'authenticate'),
      body: map,
    ).timeout(Duration(seconds: 50));

    // if(responseLogin.statusCode == ConstantsVar.successCode
    //     || responseLogin.statusCode == ConstantsVar.failedHttp){
    //   print(responseLogin.body);
    //   return responseLogin.body;
    // }else{
    //   // ErrorResponse _errResponse = ErrorResponse(code: 900,message: "Error login");
    //   // return _errResponse.errResponseToJson(_errResponse);
    //   // throw new Exception("Error login");
    // }
  }
}