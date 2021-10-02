import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:fooder/FirstScreen/mainFirstScreen.dart';
import 'package:fooder/MainScreen/drawer/subDrawer/Drawer_ChangeLangaugeComponent.dart';
import 'package:fooder/MainScreen/drawer/subDrawer/Drawer_ProfileComponent.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/module/AlertCard.dart';

class DrawerApp extends StatefulWidget {
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    Widget Logout = GestureDetector(
      onTap: () async {
        ShowLogout();
      },
      child: Container(
        height: 30,
        width: double.infinity,
        padding: EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Text("ล๊อกเอ้า"),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfffa897b), Colors.white]),
      ),
      child: Column(
        children: [
          Drawer_ChangeLangaugeComponent(),
          Drawer_ProfileComponent(),
          Logout,
        ],
      ),
    );
  }

  Future<void> ShowLogout() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertCardAsk(message: "ต้องการล๊อกเอ้าหรือไม่", func: Logout);
        });
  }

  Future<void> Logout() async {
    bool status = await UserInfoManagement().DeleteUser();
    if (status) {
      FlutterBackgroundService().sendData({
        "event": "stop_service_push_notification",
        "user_id": UserInfoManagement().User_id()
      });
      Navigator.of(context).pushNamed("${MainFirstScreen.routeName}");
    }
  }
}
