import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subNotification/notificationBillComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetNotificationUserInit.dart';
import 'package:fooder/function/ClassObjects/notificationUsers/httpObjectNotificationBill.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetNotificationUserInit.dart';
import 'package:fooder/function/http/notificationUsers/httpNotificationBill.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Map<String, NotificationBasket> data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfffa897b), Colors.white])),
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            String notification_id = data.keys.toList()[index];
            String type = data[notification_id].type;

            if (type == "2") {
              return NotificationBillComponent(
                  data: data[notification_id].notification_bill);
            } else {
              return null;
            }
          }),
    );
  }

  void loadNotification() async {
    String user_id = UserInfoManagement().User_id();
    GetNotificationUserInitRequest bufferGetNotificationUserInitRequest =
        GetNotificationUserInitRequest(user_id: user_id);
    GetNotificationUserInitResponse _data = await HttpGetNotificationUserInit(
        bufferGetNotificationUserInitRequest:
            bufferGetNotificationUserInitRequest);

    for (NotificationUserInit value in _data.list_notification) {
      String type = value.type;
      String notification_id = value.notification_id;

      if (type == "2") {
        NotificationBillRequest bufferNotificationBillRequest =
            NotificationBillRequest(notification_id: notification_id);
        NotificationBillResponse bufferNotificationBillResponse =
            await HttpGetNotificationBill(
                bufferNotificationBillRequest: bufferNotificationBillRequest);
        setState(() {
          data[notification_id] = NotificationBasket(
              type: type, notification_bill: bufferNotificationBillResponse);
        });
      }
    }
    print(data);
  }
}
