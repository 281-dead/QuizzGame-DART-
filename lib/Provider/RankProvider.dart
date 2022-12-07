import 'dart:convert';
import 'dart:async';

import 'package:flutter/services.dart';

import '../models/Rank_models.dart';

class RankProvider {
  static Future<List<dynamic>> readJson() async {
    String jsonString = await rootBundle.loadString('data/rank.json');
    final data = json.decode(jsonString);
    return data;
  }

  static Future<List<UserRank>> getAllUser() async {
    List<UserRank> lsUserRank = [];
    final data = await readJson();
    lsUserRank = data.map((e) => UserRank.fromJson(e)).toList();
    return lsUserRank;
  }
}
