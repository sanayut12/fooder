import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class Type5 {
  Map dataJson;
  Type5({@required this.dataJson});

  String Tochatmanager_id() {
    // print(object)
    return this.dataJson['chatmanager_id'];
  }

  String ToShop_id() {
    return this.dataJson['shop_id'];
  }

  String Tochatmessage_id() {
    return this.dataJson['chatmessage_id'];
  }

  ChatManager ToChatManager() {
    String shop_id = this.dataJson['shop_id'];
    String user_id = this.dataJson['user_id'];
    return ChatManager(shop_id: shop_id, user_id: user_id);
  }

  Future<ChatBox> ToChatBox() async {
    String chatmanager_id = this.dataJson['chatmanager_id'];
    String sender_id = this.dataJson['sender_id'];
    String message = this.dataJson['message'];
    String type_chat = this.dataJson['type_chat'];

    String _date_send = json.encode(dataJson['date_send']);
    DateBox date_send = await StringToDateBox(string: _date_send);
    return ChatBox(
        chatmanager_id: chatmanager_id,
        sender_id: sender_id,
        message: message,
        type_chat: type_chat,
        date_send: date_send,
        date_read: null);
  }
}
