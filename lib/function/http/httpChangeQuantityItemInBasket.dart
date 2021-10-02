import 'dart:convert';

import 'package:fooder/function/ClassObjects/httpObjectChangeQuantityItemInBasket.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ChangeQuantityItemInBasketReqsponse> HttpChangeQuantityItemInBasket(
    ChangeQuantityItemInBasketRequest
        bufferChangeQuantityItemInBasketRequest) async {
  var body = bufferChangeQuantityItemInBasketRequest.value();
  // print("$body");
  var url =
      Uri.parse("${HostName()}/post_shop/users/changeQuantityItemInBasket");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  return ChangeQuantityItemInBasketReqsponse(code: res['code']);
}
