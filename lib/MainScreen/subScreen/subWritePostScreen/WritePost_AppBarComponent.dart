import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:fooder/module/BackButton.dart';

class WritePost_AppBarComponent extends StatefulWidget {
  @override
  _WritePost_AppBarComponentState createState() =>
      _WritePost_AppBarComponentState();
}

class _WritePost_AppBarComponentState extends State<WritePost_AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [
          BackButton21(),
          Text(
            "โพสต์ข้อความ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "SukhumvitSet-Bold"),
          )
        ],
      ),
    );
  }
}
