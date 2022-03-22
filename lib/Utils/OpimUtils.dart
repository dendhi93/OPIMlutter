
import 'dart:io';

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
}