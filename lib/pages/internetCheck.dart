import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spreadsheetconnectionapp/pages/choiceScreen.dart';

class InternetConnection extends StatefulWidget {
  const InternetConnection({super.key});

  @override
  State<InternetConnection> createState() => _InternetConnectionState();
}

class _InternetConnectionState extends State<InternetConnection> {
  bool internetConnection = false;
  final title = 'Devfest 2023';
  String text = '';

  Future checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if ((result.isNotEmpty) && (result[0].rawAddress.isNotEmpty)) {
        setState(() {
          internetConnection = true;
          text = 'Connection Successful';
        });
      }
    } on SocketException catch (_) {
      setState(() {
        internetConnection = false;
        text = 'Connection Error';
      });
    }
  }

  @override
  void initState() {
    checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (internetConnection == true) {
      return choiceMethod();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: AlertDialog(
          title: Text("ERROR"),
          content: Text("Check Your Internet Connection"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Back')),
            ],
        ),
      );
    }
  }
}

// import 'dart:io';

// class InternetConnection {
//   Future checkInternetConnection() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       if ((result.isNotEmpty) && (result[0].rawAddress.isNotEmpty)) {
//         return true;
//       }
//     } on SocketException catch (_) {
//       return false;
//     }
//   }
// }
