import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/FirstScreen/mainFirstScreen.dart';
import 'package:fooder/Load/navigator_notification/page1GotoFullBillScreen.dart';
import 'package:fooder/MainScreen/mainScreen.dart';
import 'package:fooder/MainScreen/subScreen/FullBillScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import 'package:fooder/function/dataManagement/dataPositionNow.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/readJsonAddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fooder/function/dataManagement/storageFunction.dart';
import 'package:fooder/main.dart';
import 'package:fooder/module/socketioManagerForgound.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class LoadScreen extends StatefulWidget {
  static String routeName = "/load";
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              value: null,
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    );
  }

  Future LoadData() async {
    //ทำการโหลดข้อมูลจากเครื่อง
    await initLoadHostName();
    await AddressThailand().init();
    await LanguageManagement().init();
    await PositionNow().init();
    SocketioManagerForgound().init();
    final NotificationAppLaunchDetails notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    //ส่วนของระบบการแจ้งเตือน
    await Notifications();
    //ทำการอ่านข้อมูลในคุกกี้ว่ามีไหม

    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    String language = await ReadDataInStorage(key: "FOODERLANGUAGE");

    print("Language ${language}");
    if (language == null) {
      provider.ChangeLanguage('th');
    } else {
      provider.ChangeLanguage(language);
    }

    bool userinfo_check = await UserInfoManagement().init();
    //เช็คการเปิดแอปจาก icon
    print("init ${notificationAppLaunchDetails.didNotificationLaunchApp}");
    if (notificationAppLaunchDetails.payload == "") {
      //เปิดจาก icon
      String payload = notificationAppLaunchDetails.payload;
      // print("object");
      print("กด notification ตอนแอปปิด");
    } else {
      //เปิดจาก notification

      //ทำการ
      if (userinfo_check) {
        Navigator.of(context).pushNamed("${MainScreen.routeName}");
      } else {
        Navigator.of(context).pushNamed("${MainFirstScreen.routeName}");
      }
      //ทำการย้ายหน้า
      print("เปิดแอปจาก icon");
    }
  }

  void Notifications() async {
    final NotificationAppLaunchDetails notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('me');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');

        Map dataJson = json.decode(payload);
        String page = dataJson['page'];

        if (page == "1") {
          String bill_id = dataJson['bill_id'];
          GetBillFooderDataResponse data =
              await Page1GotoFullBillScreen(bill_id);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => FullBillScreen(data: data)));
        }
      }
      // selectedNotificationPayload = payload;
      // selectNotificationSubject.add(payload);
    });
  }
}

//////////////////////////////////////// Notification ///////////////////////////////
// class Notifications {
  

//   Future<void> _showNotification() async {
//     final NotificationAppLaunchDetails notificationAppLaunchDetails =
//         await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     print(" dddddd ${notificationAppLaunchDetails.didNotificationLaunchApp}");
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//             'your channel id', 'your channel name', 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticke');
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         1, 'plain titleddddddddddd', 'plain ddddbody', platformChannelSpecifics,
//         payload: 'item xs');
//   }

//   Future<void> UsersNotification(String message) async {
//     final NotificationAppLaunchDetails notificationAppLaunchDetails =
//         await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     print(" dddddd ${notificationAppLaunchDetails.didNotificationLaunchApp}");
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//             'your channel id', 'your channel name', 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticke');
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         3, 'users', 'plain ${message}', platformChannelSpecifics,
//         payload: 'item xs');
//   }
// }
