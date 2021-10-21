import 'package:flutter/cupertino.dart';

class ChatCenterImageRequest {
  List<String> message;
  String chatmanager_id, user_id, shop_id, sender_id, type_chat;
  ChatCenterImageRequest(
      {@required this.chatmanager_id,
      @required this.user_id,
      @required this.shop_id,
      @required this.sender_id,
      @required this.message,
      @required this.type_chat});
  Map<String, dynamic> value() {
    return {
      "chatmanager_id": this.chatmanager_id,
      "user_id": this.user_id,
      "shop_id": this.shop_id,
      "sender_id": this.sender_id,
      "message": this.message,
      "type_chat": this.type_chat
    };
  }
}

class ChatCenterImageResponse {
  String code;
  ChatCenterImageResponse({@required this.code});
}
