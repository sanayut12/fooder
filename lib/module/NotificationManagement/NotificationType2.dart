import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fooder/function/httpBackground/httpGetNotificationConfirmBillShopder.dart';
import 'package:fooder/function/httpBackground/object/httpObjectNotificationConfirmBillShopder.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> NotificationType2(
    String host, String notification_id, int id) async {
  NotificationConfirmBillShopderRequest
      bufferNotificationConfirmBillShopderRequest =
      NotificationConfirmBillShopderRequest(notification_id: notification_id);
  NotificationConfirmBillShopderResponse
      bufferNotificationConfirmBillShopderResponse =
      await HttpGetNotificationConfirmBillShopder(
          bufferNotificationConfirmBillShopderRequest:
              bufferNotificationConfirmBillShopderRequest,
          host: host);

  String name = bufferNotificationConfirmBillShopderResponse.shop.name;
  String bill_id =
      bufferNotificationConfirmBillShopderResponse.notification.bill_id;
  String step = bufferNotificationConfirmBillShopderResponse.notification.step;

  String detail = bufferNotificationConfirmBillShopderResponse.post_shop.detail;
  String _detail = detail.length > 20 ? detail.substring(0, 20) + ".." : detail;
  String _step = "";
  if (step == "1") {
    _step = "ได้ทำการยืนยันสินค้าแล้ว";
  } else if (step == "2") {
    _step = "ได้ทำการจัดสินค้าสำเร็จแล้ว";
  } else if (step == "3") {
    _step = "กำลังจัดส่งสินค้า";
  } else if (step == "4") {
    _step = "ส่งสินค้าสำเร็จ";
  }
  String title = "ร้าน ${name} เลขที่คำสั่งซื้อ ${bill_id}";
  String message = "จากโพสต์ ${_detail} ${_step}";
  String dataToFront = json.encode({"page": "1", "bill_id": bill_id});
  print(dataToFront);
  ShowNotificationBill(id, title, message, dataToFront);
}

Future<void> ShowNotificationBill(
    int id, String title, String message, String dataToFront) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  ); // styleInformation: bigPicture
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      id, '${title}', '${message}', platformChannelSpecifics,
      payload: '${dataToFront}');
}
