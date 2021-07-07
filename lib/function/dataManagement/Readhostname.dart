import 'dart:convert';

import 'package:fooder/function/dataManagement/readjson.dart';

String hostname;

void initLoadHostName() async {
  hostname = await json.decode(await readJson())['http'];
  print("${hostname}");
}

String HostName() {
  return hostname;
}
