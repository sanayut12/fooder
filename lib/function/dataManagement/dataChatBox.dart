import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class ChatManager {
  String user_id, shop_id;
  ChatManager({@required this.shop_id, @required this.user_id});
}

//<chatmessage_id,data>
class ChatBox {
  String chatmanager_id, sender_id, message, type_chat;
  DateBox date_send, date_read;

  ChatBox(
      {@required this.chatmanager_id,
      @required this.sender_id,
      @required this.message,
      @required this.type_chat,
      @required this.date_send,
      @required this.date_read});
}

class TranformChatBox {
  String jsonString;
  TranformChatBox({@required this.jsonString});

  Future<ChatBox> chatbox() async {
    Map dataJson = json.decode(this.jsonString);
    String chatmanager_id = dataJson['chatmanager_id'];
    String sender_id = dataJson['sender_id'];
    String message = dataJson['message'];
    String type_chat = dataJson['type_chat'];
    Map _date_send = dataJson['date_send'];
    Map _date_read = dataJson['date_read'];
    print(_date_read);
    DateBox date_send = await StringToDateBox(string: json.encode(_date_send));

    DateBox date_read = null;
    if (_date_read != null) {
      date_read = await StringToDateBox(string: json.encode(_date_read));
    }
    return ChatBox(
        chatmanager_id: chatmanager_id,
        sender_id: sender_id,
        message: message,
        type_chat: type_chat,
        date_send: date_send,
        date_read: date_read);
  }
}

class ShopProfileMini {
  String name, image;
  ShopProfileMini({@required this.name, @required this.image});
}
