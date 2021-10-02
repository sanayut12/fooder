import 'package:flutter/cupertino.dart';

import 'package:fooder/function/ClassObjects/notificationUsers/httpObjectNotificationBill.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<NotificationBillResponse> HttpGetNotificationBill(
    {@required NotificationBillRequest bufferNotificationBillRequest}) async {
  var body = bufferNotificationBillRequest.value();

  var url = Uri.parse("${HostName()}/users/notification/getNotificationBill");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  // print(res);
  String code = res['code'];

  Map _notification = res['data']['notification_user'];
  Map _post_shop = res['data']['post_shop'];
  Map _shop = res['data']['shop'];

  NotificationUser notification = NotificationUser(
      step: _notification['other'],
      click: _notification['click'],
      bill_id: _notification['bill_id']);

  NotificationPostShop post_shop = NotificationPostShop(
      post_id: _post_shop['post_id'], detail: _post_shop['detail']);

  NotificationShop shop = NotificationShop(
      shop_id: _shop['shop_id'], name: _shop['name'], image: _shop['image']);
  return NotificationBillResponse(
      notification: notification, post_shop: post_shop, shop: shop, code: code);
}
