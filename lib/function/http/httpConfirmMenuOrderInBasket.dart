import 'dart:convert';

import 'package:fooder/function/ClassObjects/httpObjectConfirmMenuOrderInBasket.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetOrderBasketFooder.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<ConfirmMenuOrderInBasketResponse> HttpConfirmMenuOrderInBasket(
    ConfirmMenuOrderInBasketRequest
        bufferConfirmMenuOrderInBasketRequest) async {
  var body = bufferConfirmMenuOrderInBasketRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/foodbuy/confirmMenuOrderInBasket");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  print(res);
  ConfirmMenuOrderInBasketResponse bufferConfirmMenuOrderInBasketResponse =
      ConfirmMenuOrderInBasketResponse(code: res['code']);
  return bufferConfirmMenuOrderInBasketResponse;
}
