import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Map language;

class LanguageManagement {
  void init() async {
    String response = await rootBundle.loadString('assets/langauge.json');
    language = await json.decode(response);
  }

  String value(String number, String _language) {
    return language[number][_language];
  }
}
