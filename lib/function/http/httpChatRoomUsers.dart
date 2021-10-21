import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectChatRoomUsers.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<ChatRoomUsersResponse> HttpChatRoomUsers(
    {@required ChatRoomUsersRequest bufferChatRoomUsersRequest}) async {
  var body = bufferChatRoomUsersRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/chat/chatRoomUsers");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  Map _shop_info = res['data']['shop_info'];
  String code = res['code'];

  ChatRoomUsers_ShopInfo shop_info = ChatRoomUsers_ShopInfo(
      shop_id: _shop_info['shop_id'],
      name: _shop_info['name'],
      image: _shop_info['image']);
  // print(chatmanager_id);
  return ChatRoomUsersResponse(
      chatmanager_id: bufferChatRoomUsersRequest.chatmanager_id,
      shop_info: shop_info,
      code: code);
}
