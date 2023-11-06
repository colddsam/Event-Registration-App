import 'package:flutter/material.dart';
import 'package:spreadsheetconnectionapp/api/sheets/user_sheets_api.dart';
import 'package:spreadsheetconnectionapp/pages/firstScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await userSheetsApi.init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstScreen(),
  ));
}

