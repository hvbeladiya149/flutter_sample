import 'dart:io';

import 'package:flutter/material.dart';

class Constants{
  static Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }


  static progressDialog(bool isLoading, BuildContext context) {
    AlertDialog dialog = new AlertDialog(
      content: new Container(
          height: 40.0,
          child: new Center(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                Padding(padding: EdgeInsets.only(left: 15.0)),
                new Text("Please wait")
              ],
            ),
          )),
      contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
    );
    if (!isLoading) {
      Navigator.of(context).pop();
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return dialog;
          });
    }
  }

  static resultInApi(var value,var isError){
    Map<String,dynamic> map = {
      "isError" : isError,
      "value" : value
    };
    return map;
  }
}