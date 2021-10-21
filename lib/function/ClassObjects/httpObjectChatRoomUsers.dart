import 'package:flutter/cupertino.dart';

class ChatRoomUsersRequest {
  String chatmanager_id;
  ChatRoomUsersRequest({@required this.chatmanager_id});
  Map<String, dynamic> value() {
    return {"chatmanager_id": this.chatmanager_id};
  }
}

class ChatRoomUsersResponse {
  String chatmanager_id;

  ChatRoomUsers_ShopInfo shop_info;
  String code;
  ChatRoomUsersResponse(
      {@required this.chatmanager_id,
      @required this.shop_info,
      @required this.code});
}

class ChatRoomUsers_ShopInfo {
  String shop_id, name, image;
  ChatRoomUsers_ShopInfo(
      {@required this.shop_id, @required this.name, @required this.image});
}
