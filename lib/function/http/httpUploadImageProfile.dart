import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAllAddress.dart';
import 'package:fooder/function/ClassObjects/httpObjectUploadImageProfile.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<UploadImageProfileResponse> HttpUploadImageProfile(
    UploadImageProfileRequest bufferUploadImageProfileRequest) async {
  var body = bufferUploadImageProfileRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/users/uploadProfileUser");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);
  String code = res['code'];

  return UploadImageProfileResponse(code: code);
}
