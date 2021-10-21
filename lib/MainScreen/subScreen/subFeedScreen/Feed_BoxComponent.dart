import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/WritePostScreen.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';

class Feed_BoxComponent extends StatefulWidget {
  @override
  _Feed_BoxComponentState createState() => _Feed_BoxComponentState();
}

class _Feed_BoxComponentState extends State<Feed_BoxComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    Uint8List image = UserInfoManagement().Image();
    Widget ShowImage = image == null
        ? Container(
            height: weight_screen * 0.15,
            width: weight_screen * 0.15,
          )
        : Container(
            height: weight_screen * 0.15,
            width: weight_screen * 0.15,
            margin: EdgeInsets.only(
                top: weight_screen * 0.05, left: weight_screen * 0.05),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: MemoryImage(image))),
          );
    Widget Name = Container(
      child: Text("คุณกำลังมองหาอะไรอยู่?"),
    );

    Widget Button = GestureDetector(
      onTap: () {
        OpenWriteScreen();
      },
      child: Container(
        margin: EdgeInsets.only(right: weight_screen * 0.05),
        child: Row(
          children: [Icon(Icons.image), Text("Photo")],
        ),
      ),
    );
    return Container(
      height: weight_screen * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [ShowImage, Name],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Button],
          )
        ],
      ),
    );
  }

  Future<void> OpenWriteScreen() async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => WritePostScreen()));
  }
}
