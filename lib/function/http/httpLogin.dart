import '../dataManagement/readjson.dart';
import '../../ClassObjects/httpObjectLogin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

void initHttpLogin() async {
  hostname = await json.decode(await readJson())['http'];
}

Future<LoginResponse> HttpLogin(LoginRequest bufferLoginRequest) async {
  var body = {
    'phone': bufferLoginRequest.phone,
    'password': bufferLoginRequest.password
  };
  var url = Uri.parse(hostname + "/users/login");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  print(res);
  DataUserInfo userInfo = DataUserInfo(
      user_id: res['userInfo']['user_id'],
      name: res['userInfo']['name'],
      phone: res['userInfo']['phone'],
      email: res['userInfo']['email'],
      image: res['userInfo']['image']);
  LoginResponse data = LoginResponse(userInfo: userInfo, code: res['code']);
  return data;
}
