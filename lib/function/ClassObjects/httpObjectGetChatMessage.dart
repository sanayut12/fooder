import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';

class GetChatMessageRequest {
  String chatmanager_id;
  GetChatMessageRequest({@required this.chatmanager_id});
  Map<String, String> value() {
    return {"chatmanager_id": this.chatmanager_id};
  }
}

class GetChatMessageResponse {
  Map<String, ChatBox> bufferChatBox;
  String code;
  GetChatMessageResponse({@required this.bufferChatBox, @required this.code});
}
