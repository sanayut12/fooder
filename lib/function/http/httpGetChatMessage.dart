import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetChatMessage.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetChatMessageResponse> HttpGetChatMessage(
    {@required GetChatMessageRequest bufferGetChatMessageRequest,
    @required String host}) async {
  var body = bufferGetChatMessageRequest.value();

  var url = Uri.parse("${host}/chat/getChatMessage");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);
  Map<String, ChatBox> bufferChatBox = {};
  String code = res['code'];
  Map buffer_message = res['data']['buffer_message'];

  buffer_message.forEach((key, value) {
    Map _date_send = value['date_send'];
    DateBox date_send = DateBox(
        year: _date_send['year'],
        month: _date_send['month'],
        day: _date_send['day'],
        hour: _date_send['hour'],
        min: _date_send['min'],
        sec: _date_send['sec']);
    Map _date_read = value['date_read'];
    DateBox date_read = null;
    if (_date_read != null) {
      date_read = DateBox(
          year: _date_read['year'],
          month: _date_read['month'],
          day: _date_read['day'],
          hour: _date_read['hour'],
          min: _date_read['min'],
          sec: _date_read['sec']);
    }
    bufferChatBox[key] = ChatBox(
        chatmanager_id: value['chatmanager_id'],
        sender_id: value['sender_id'],
        message: value['message'],
        type_chat: value['type_chat'],
        date_send: date_send,
        date_read: date_read);
  });
  return GetChatMessageResponse(bufferChatBox: bufferChatBox, code: code);
}
