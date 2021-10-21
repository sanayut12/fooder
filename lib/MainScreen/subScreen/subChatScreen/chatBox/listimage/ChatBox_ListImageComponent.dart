import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/listimage/ChatBox_ImageComponent.dart';

class ChatBox_ListImageComponent extends StatefulWidget {
  List<Uint8List> bufferImage;
  ScrollController controller;
  final Function fun;
  ChatBox_ListImageComponent(
      {@required this.bufferImage,
      @required this.controller,
      @required this.fun});

  @override
  _ChatBox_ListImageComponentState createState() =>
      _ChatBox_ListImageComponentState();
}

class _ChatBox_ListImageComponentState
    extends State<ChatBox_ListImageComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Uint8List> bufferImage = this.widget.bufferImage;

    return Container(
      height: 150,
      color: Colors.white,
      width: double.infinity,
      child: ListView.builder(
          itemCount: bufferImage.length,
          scrollDirection: Axis.horizontal,
          controller: this.widget.controller,
          itemBuilder: (BuildContext context, int index) {
            return ChatBox_ImageComponent(
                image: bufferImage[index], index: index, fun: this.widget.fun);
          }),
    );
  }
}
