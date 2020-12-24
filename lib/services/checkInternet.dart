// packages
import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckInternet {
  // ignore: cancel_subscriptions
  StreamSubscription<DataConnectionStatus> listener;
  var internetStatus = "Unknown";
  var contentMessage = "Unknown";

  void _showDialog(String title, String content, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  checkConnection(BuildContext context) async {
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          internetStatus = "Connected to the Internet";
          contentMessage = "Connected to the Internet";
          break;
        case DataConnectionStatus.disconnected:
          internetStatus = "You are disconnected to the Internet";
          contentMessage = "You are disconnected to the Internet";
          _showDialog(internetStatus, contentMessage, context);
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;
  }
}
