import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectBuyNowItem.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<BuyNowItemResponse> HttpBuyNowItem(
    {@required BuyNowItemRequest bufferBuyNowItemRequest}) async {
  var body = bufferBuyNowItemRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/foodbuy/buyNowItems");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  return BuyNowItemResponse(code: res['code']);
}
