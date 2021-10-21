import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fooder/module/BackButton.dart';

class PinPosition_AppBarComponent extends StatefulWidget {
  @override
  _PinPosition_AppBarComponentState createState() =>
      _PinPosition_AppBarComponentState();
}

class _PinPosition_AppBarComponentState
    extends State<PinPosition_AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [
          BackButton21(),
          Text(
            "ปักหมุดที่อยู่",
            style: style,
          )
        ],
      ),
    );
  }
}
