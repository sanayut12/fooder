import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fooder/module/NotificationManagement/NotificationType2.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
int index_notification_bill = 0; //0 - 1000
void BackGroundServiceManager(dynamic data, String host) {
  print(data);
  // print(data.runtimeType);

  String dataString = data;
  Map dataJson = json.decode(dataString);

  String type = dataJson['type'];
  String notification_id = dataJson['notification_id'];
  // _showNotification();

  if (type == "2") {
    NotificationType2(host, notification_id, index_notification_bill);
    index_notification_bill += 1;
    if (index_notification_bill > 1000) {
      index_notification_bill = 0;
    }
  }
}

Future<void> _showNotification() async {
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
      0, 'plain title', 'plain body', platformChannelSpecifics,
      payload: 'item x');
}
