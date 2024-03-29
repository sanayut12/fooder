import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fooder/module/BackButton.dart';

class CreateAddressUser_appbarComponent extends StatefulWidget {
  @override
  _CreateAddressUser_appbarComponentState createState() =>
      _CreateAddressUser_appbarComponentState();
}

class _CreateAddressUser_appbarComponentState
    extends State<CreateAddressUser_appbarComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    Widget BackButton = IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));

    Widget title = Container(
      child: Text(
        "เพิ่มที่อยู่",
        style: TextStyle(
            fontSize: weight_screen * 0.05,
            fontWeight: FontWeight.w800,
            color: Colors.white),
      ),
    );
    return Container(
      height: weight_screen * 0.15,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [BackButton21(), Expanded(child: title)],
      ),
    );
  }
}
