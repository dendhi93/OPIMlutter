
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OpimUtils{

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void snackBarMessage(String message, BuildContext context) {
    // final snackBar = SnackBar(content: Text(message),backgroundColor: Colors.blue);
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: Colors.blue
      ),
    );
  }

  void snackBarMessageScaffoldKey(String message, GlobalKey<ScaffoldState> scaffoldKey) {
    // ignore: deprecated_member_use
    scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 3),
        ));
  }

  static Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.co.id');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  void showNoActionDialog(String title, String content, BuildContext context) =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: new Text(title),
                content: new Text(content),
                actions: <Widget>[
                  new TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text("Close"))
                ]
            );
          }
      );

  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key, String message) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text(message,style: TextStyle(color: Colors.green),)
                      ]),
                    )
                  ]));
        });
  }


  // void showYesNoActionDialog(String title, String content, BuildContext context, YesNoAction dialogAction) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //             title: new Text(title),
  //             content: new Text(content),
  //             actions: <Widget>[
  //               new TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                     dialogAction.yesAction();
  //                   },
  //                   child: new Text("Yes")),
  //               new TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: new Text("No"))
  //             ]
  //         );
  //       }
  //   );
  // }

  void showYesNoActionDialog(String content, BuildContext context, DialogAction dialogAction) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset('assets/images/opim_launcher.png', width: 80, height: 60,),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      content,
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: RawMaterialButton(
                              onPressed: () {
                                dialogAction.yesAction();
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.white),
                              ),
                              fillColor: Colors.blue,
                            ),
                          ),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: RawMaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                            fillColor: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  String dateChangeFormat(String stDateResource, String dateFormat){
    String dateResult = "";
    DateTime dtDateResource = DateTime.parse(stDateResource);
    try{
      dateResult = new DateFormat(dateFormat).format(dtDateResource);
    }catch(error){
      print("err parse date $error");
    }
    return dateResult;
  }
}

class DialogAction{
  void yesAction(){}
  void noAction(){}
}