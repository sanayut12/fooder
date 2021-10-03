import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectBuyNowItem.dart';
import 'package:fooder/function/ClassObjects/httpObjectChangeHowPay.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ChangeHowPayResponse> HttpChangeHowPay(
    {@required ChangeHowPayRequest bufferChangeHowPayRequest}) async {
  var body = bufferChangeHowPayRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/billFooder/changeHowPayFooder");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  return ChangeHowPayResponse(code: res['code']);
}
