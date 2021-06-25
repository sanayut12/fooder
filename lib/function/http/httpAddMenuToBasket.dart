import 'dart:convert';
import 'package:fooder/ClassObjects/httpObjectAddMenutoBasket.dart';
import 'package:fooder/function/dataManagement/readjson.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

void initHttpAddMenuToBasket() async {
  hostname = await json.decode(await readJson())['http'];
}

//r
Future<AddMenuToBasketResponse> HttpAddMenuToBasket(
    AddMenuTobasketRequest bufferAddMenuTobasketRequest) async {
  var body = bufferAddMenuTobasketRequest.value();
  // print("$body");
  var url = Uri.parse(hostname + "/foodbuy/addMenuToBasket");
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
