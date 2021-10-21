import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectChatConnection.dart';
import 'package:fooder/function/ClassObjects/httpObjectCreateAddress.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<ChatConnectionResponse> HttpChatConnection(
    {@required ChatConnectRequest bufferChatConnectRequest}) async {
  var body = bufferChatConnectRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/chat/chatConnection");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  String chatmanager_id = res['data']['chatmanager_id'];
  Map shop_info = res['data']['shop_info'];
  String name = shop_info['name'];
  String image = shop_info['image'];
  ShopProfileMini shopProfileMini = ShopProfileMini(name: name, image: image);
  String user_id = bufferChatConnectRequest.user_id;
  String shop_id = bufferChatConnectRequest.shop_id;

  ChatManager chatManager = ChatManager(shop_id: shop_id, user_id: user_id);
  String code = res['code'];
  print(chatmanager_id);
  return ChatConnectionResponse(
      chatmanager_id: chatmanager_id,
      chatManager: chatManager,
      shopProfileMini: shopProfileMini,
      code: code);
}
