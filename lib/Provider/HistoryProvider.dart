import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/History_models.dart';

class HistoryProvider {
  static Future<List<dynamic>> readJson() async {
    String jsonText = await rootBundle.loadString('data/history.json');
    final data = json.decode(jsonText);
    return data;
  }

  static Future<List<HistoryObject>> getListHistory() async {
    List<HistoryObject> lsHistory = [];
    final data = await readJson();
    lsHistory = data.map((e) => HistoryObject.fromJson(e)).toList();
    return lsHistory;
  }
}
