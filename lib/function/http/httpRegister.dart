import 'package:fooder/function/ClassObjects/httpObjectRegister.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<RegisterResponse> HttpRegister(
    RegisterRequest bufferRegisterRequest) async {
  var body = {
    'name': bufferRegisterRequest.name,
    'password': bufferRegisterRequest.password,
    'phone': bufferRegisterRequest.phone,
    'email': bufferRegisterRequest.email
  };
  var url = Uri.parse(HostName() + "/users/register");
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
  var url = Uri.parse("${HostName()}/users/confirmRegister");
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
