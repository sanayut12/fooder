import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectWritePostUsers.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<WritePostUsersResponse> HttpWritePostUsers(
    {@required WritePostUsersRequest bufferWritePostUsersRequest}) async {
  var body = bufferWritePostUsersRequest.value();
  var url = Uri.parse("${HostName()}/users/writePost");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  String code = res['code'];

  return WritePostUsersResponse(code: code);
}
