import 'dart:typed_data';

import 'package:fooder/function/ClassObjects/httpObjectLogin.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<LoginResponse> HttpLogin(LoginRequest bufferLoginRequest) async {
  var body = {
    'phone': bufferLoginRequest.phone,
    'password': bufferLoginRequest.password
  };
  var url = Uri.parse(HostName() + "/users/login");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  print(res);

  Uint8List image = null;
  if (res['userInfo']['image'] != null) {
    image = base64Decode(res['userInfo']['image']);
  }

  DataUserInfo userInfo = DataUserInfo(
      user_id: res['userInfo']['user_id'],
      name: res['userInfo']['name'],
      phone: res['userInfo']['phone'],
      email: res['userInfo']['email'],
      image: image);
  LoginResponse data = LoginResponse(userInfo: userInfo, code: res['code']);
  return data;
}
