import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';

class Drawer_ProfileComponent extends StatefulWidget {
  @override
  _Drawer_ProfileComponentState createState() =>
      _Drawer_ProfileComponentState();
}

class _Drawer_ProfileComponentState extends State<Drawer_ProfileComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    Widget ImageUser = Container(
      height: weight_screen * 0.4,
      width: weight_screen * 0.4,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(UserInfoManagement().Image()))),
    );

    Widget ShopName = Container(
      child: Text(
        "${UserInfoManagement().Name()}",
        style: TextStyle(
            fontSize: weight_screen * 0.09, fontWeight: FontWeight.bold),
      ),
    );
    return Container(
      margin: EdgeInsets.only(top: weight_screen * 0.1),
      child: Column(
        children: [ImageUser, ShopName],
      ),
    );
  }
}
