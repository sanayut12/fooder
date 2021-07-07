import 'dart:convert';
import 'package:fooder/function/ClassObjects/httpObjectAddMenutoBasket.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<AddMenuToBasketResponse> HttpAddMenuToBasket(
    AddMenuTobasketRequest bufferAddMenuTobasketRequest) async {
  var body = bufferAddMenuTobasketRequest.value();
  // print("$body");
  var url = Uri.parse(HostName() + "/foodbuy/addMenuToBasket");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  AddMenuToBasketResponse bufferAddMenuToBasketResponse =
      AddMenuToBasketResponse(code: res['code']);

  return bufferAddMenuToBasketResponse;
}
