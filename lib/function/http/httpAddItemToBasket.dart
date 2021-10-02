import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectAddItemtoBasket.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<AddItemToBasketResponse> HttpAddMenuToBasket(
    {@required AddItemTobasketRequest bufferAddMenuTobasketRequest}) async {
  var body = bufferAddMenuTobasketRequest.value();
  // print("$body");
  var url = Uri.parse(HostName() + "/foodbuy/addItemToBasket");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  AddItemToBasketResponse bufferAddItemToBasketResponse =
      AddItemToBasketResponse(code: res['code']);

  return bufferAddItemToBasketResponse;
}
