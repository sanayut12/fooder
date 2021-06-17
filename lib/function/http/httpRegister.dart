

import '../dataManagement/readjson.dart';
import '../../ClassObjects/httpObjectRegister.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

void initHttpRegister() async {
  hostname = await json.decode(await readJson())['http'];
}

Future<RegisterResponse> HttpRegister(
    RegisterRequest bufferRegisterRequest) async {
  var body = {
    'name': bufferRegisterRequest.name,
    'password': bufferRegisterRequest.password,
    'phone': bufferRegisterRequest.phone,
    'email': bufferRegisterRequest.email
  };
  var url = Uri.parse(hostname + "/users/register");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  RegisterResponse data = RegisterResponse(
      message: res["message"], key: res["key"], code: res["code"]);
  return data;
}

Future<ConfirmRegisterResponse> HttpConfirmRegister(
    ConfirmRegisterRequest bufferConfirmRegisterRequest) async {
  var body = {
    'phone': bufferConfirmRegisterRequest.phone,
    'code': bufferConfirmRegisterRequest.code
  };
  var url = Uri.parse(hostname + "/users/confirmRegister");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  ConfirmRegisterResponse data = ConfirmRegisterResponse(
      message: res["message"], key: res["key"], code: res["code"]);
  return data;
}
