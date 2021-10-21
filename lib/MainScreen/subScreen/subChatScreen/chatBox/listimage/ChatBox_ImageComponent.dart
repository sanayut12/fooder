import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBox_ImageComponent extends StatefulWidget {
  Uint8List image;
  int index;
  final Function fun;
  ChatBox_ImageComponent(
      {@required this.image, @required this.index, @required this.fun});
  @override
  _ChatBox_ImageComponentState createState() => _ChatBox_ImageComponentState();
}

class _ChatBox_ImageComponentState extends State<ChatBox_ImageComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonDelete = GestureDetector(
      onTap: () {
        this.widget.fun(this.widget.index);
      },
      child: Container(
        child: Icon(
          Icons.dangerous_outlined,
          size: 25,
        ),
      ),
    );
    return Container(
      height: 150,
      width: 150,
      alignment: Alignment.center,
      child: Container(
        height: 140,
        width: 140,
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover, image: MemoryImage(this.widget.image))),
        child: ButtonDelete,
      ),
    );
  }
}
