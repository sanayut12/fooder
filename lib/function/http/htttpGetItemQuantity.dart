import 'dart:convert';
import 'package:fooder/function/ClassObjects/htttpObjectGetItemQuantity.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<GetItemQuantityResponse> HttpGetItemQuantity(
    GetItemQuantityRequest bufferGetItemQuantityRequest) async {
  var body = bufferGetItemQuantityRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/item/getItemQuantity");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  print(res);
  int quantity = res['data']['quantity'];
  String code = res['code'];

  return GetItemQuantityResponse(quantity: quantity, code: code);
}
