import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetListChatManager.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetListChatManagerResponse> HttpGetListChatManager(
    {@required GetListChatManagerRequest bufferGetListChatManagerRequest,
    @required String host}) async {
  var body = bufferGetListChatManagerRequest.value();

  var url = Uri.parse("${host}/chat/chatGetListChatManagerFooder");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);
  Map<String, ShopProfileMini> bufferShopProfileMini = {};
  List<String> ChatSort = [];
  Map<String, ChatManager> bufferChatmanager = {}; //< chatmanager_id, data>
  String code = res['code'];
  List list_chatmanager_id = res['data']['list_chatmanager_id'];
  Map chatmanager = res['data']['chatmanager'];
  Map shop = res['data']['shop'];

  list_chatmanager_id.forEach((element) {
    ChatSort.add(element);
  });

  chatmanager.forEach((key, value) {
    bufferChatmanager[key] =
        ChatManager(shop_id: value['shop_id'], user_id: value['user_id']);
  });
  shop.forEach((key, value) {
    bufferShopProfileMini[key] =
        ShopProfileMini(name: value['name'], image: value['image']);
  });
  return GetListChatManagerResponse(
      bufferChatManager_id: ChatSort,
      bufferChatManager: bufferChatmanager,
      bufferShopProfileMini: bufferShopProfileMini,
      code: code);
}
