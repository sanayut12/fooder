import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';

class WritePost_MiniProfileComponent extends StatefulWidget {
  @override
  _WritePost_MiniProfileComponentState createState() =>
      _WritePost_MiniProfileComponentState();
}

class _WritePost_MiniProfileComponentState
    extends State<WritePost_MiniProfileComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    Uint8List image = UserInfoManagement().Image();
    String name = UserInfoManagement().Name();
    Widget ShowImage = image == null
        ? Container(
            height: weight_screen * 0.2,
            width: weight_screen * 0.2,
          )
        : Container(
            height: weight_screen * 0.2,
            width: weight_screen * 0.2,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: MemoryImage(image))),
          );
    Widget Name = Container(
      child: Text("${name}"),
    );
    return Container(
      height: weight_screen * 0.25,
      width: weight_screen,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: weight_screen * 0.05),
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [ShowImage, Name],
      ),
    );
  }
}
