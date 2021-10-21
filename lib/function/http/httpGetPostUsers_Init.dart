import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostUsers_Init.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<GetPostUsersInitResponse> HttpGetPostUsersInit(
    {@required GetPostUsersInitRequest bufferGetPostUsersInitRequest}) async {
  var body = bufferGetPostUsersInitRequest.value();
  var url = Uri.parse("${HostName()}/users/getPostUsersForUsers_Init");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  Map res = jsonDecode(uriResponse.body);
  // print(res);
  List _bufferPostUser_id = res['data']['list_post_id'];
  String code = res['code'];
  List<String> bufferPostUser_id = [];
  _bufferPostUser_id.forEach((element) {
    bufferPostUser_id.add(element);
  });
  return GetPostUsersInitResponse(
      bufferPostUser_id: bufferPostUser_id, code: code);
}
