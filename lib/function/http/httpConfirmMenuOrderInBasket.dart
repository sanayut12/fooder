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
Future<ConfirmItemsInBasketResponse> HttpConfirmItemsInBasket(
    ConfirmItemsInBasketRequest bufferConfirmItemsInBasketRequest) async {
  var body = bufferConfirmItemsInBasketRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/foodbuy/confirmItemsInBasket");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  print(res);
  String bill_id = res['data']['bill_id'];

  String code = res['code'];

  List<String> list_over = [];
  List _list_over = res['data']['list_over'];
  _list_over.forEach((element) {
    list_over.add(element);
  });
  ConfirmItemsInBasketResponse bufferConfirmItemsInBasketResponse =
      ConfirmItemsInBasketResponse(
          bill_id: bill_id, bufferInventoryOver: list_over, code: code);
  return bufferConfirmItemsInBasketResponse;
}
