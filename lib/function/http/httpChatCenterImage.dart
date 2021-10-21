import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectChatCenterImage.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetListChatManager.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ChatCenterImageResponse> HttpChatCenterImage(
    {@required ChatCenterImageRequest bufferChatCenterImageRequest}) async {
  var body = bufferChatCenterImageRequest.value();

  var url = Uri.parse("${HostName()}/chat/chatCenterImage");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);

  // String code = res['code'];

  // return ChatCenterImageResponse(code: code);
}
