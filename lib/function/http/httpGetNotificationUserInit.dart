import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetNotificationUserInit.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/httpBackground/object/httpObjectNotificationConfirmBillShopder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetNotificationUserInitResponse> HttpGetNotificationUserInit(
    {@required
        GetNotificationUserInitRequest
            bufferGetNotificationUserInitRequest}) async {
  var body = bufferGetNotificationUserInitRequest.value();

  var url = Uri.parse("${HostName()}/users/getNotificationUserInit");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);
  String code = res['code'];
  List<NotificationUserInit> list_notification = [];

  List _list_notification = res['data']['list_notification'];
  _list_notification.forEach((element) {
    list_notification.add(NotificationUserInit(
        notification_id: element['notification_id'], type: element['type']));
  });
  return GetNotificationUserInitResponse(
      list_notification: list_notification, code: code);
}
