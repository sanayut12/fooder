import 'dart:convert';
import 'package:fooder/function/ClassObjects/httpObjectCreateAddress.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<CreateAddressResponse> HttpCreateAddress(
    CreateAddressRequest bufferCreateAddressRequest) async {
  var body = bufferCreateAddressRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/users/createAddress");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);
  CreateAddressResponse bufferCreateAddressResponse =
      CreateAddressResponse(code: res['code']);
  return bufferCreateAddressResponse;
}
