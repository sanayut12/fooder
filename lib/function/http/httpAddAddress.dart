import 'dart:convert';
import 'package:fooder/function/ClassObjects/httpObjectAddAddress.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<AddAddressResponse> HttpAddAddress(
    AddAddressRequest bufferAddAddressRequest) async {
  var body = bufferAddAddressRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/users/addAddress");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);
  AddAddressResponse bufferAddAddressResponse =
      AddAddressResponse(code: res['code']);
  return bufferAddAddressResponse;
}
