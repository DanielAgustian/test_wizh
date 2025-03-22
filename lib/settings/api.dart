import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class APICall {
  static Future<List> loadJson(String src) async {
    String jsonString = await rootBundle.loadString(src);
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList;
  }
}
