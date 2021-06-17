import 'package:flutter/services.dart';

Future<String> readJson() async {
  final String response = await rootBundle.loadString('assets/config.json');
  return response;
}
