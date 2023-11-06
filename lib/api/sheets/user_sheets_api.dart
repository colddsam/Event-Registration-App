import 'dart:convert';

import 'package:gsheets/gsheets.dart';
import 'package:spreadsheetconnectionapp/model/user.dart';

class userSheetsApi {
  static const _credentials = "Enter your cloud service account key";
  static final _spreadsheetId = 'Enter your spread sheet id';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;
  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Enter your sheet name');
      final firstRow = userFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<String> getRows() async {
    if (_userSheet == null) {
      return '';
    }
    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? '' : lastRow.first;
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<User?> getByID(String id) async {
    if (_userSheet == null) return null;
    final json = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : User.fromJson(json);
  }

  static Future<bool> update(String id, Map<String, dynamic> user) async {
    if (_userSheet == null) return false;
    return _userSheet!.values.map.insertRowByKey(id, user);
  }
}
