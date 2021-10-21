import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/ChatBox_Message.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/module/socketioManagerForgound.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:fooder/provider/type5.dart';
import 'package:provider/provider.dart';

class Chat_ListMessage extends StatefulWidget {
  String chatmanager_id;
  Chat_ListMessage({@required this.chatmanager_id});
  @override
  _Chat_ListMessageState createState() => _Chat_ListMessageState();
}

class _Chat_ListMessageState extends State<Chat_ListMessage> {
  ScrollController controller = ScrollController();
  Map<String, ChatBox> bufferChatBox = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    ChatNotify();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    UnChatNotify();
  }

  @override
  Widget build(BuildContext context) {
    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    ChatManager chatManager =
        provider.bufferChatmanager[this.widget.chatmanager_id];
    String shop_id = chatManager.shop_id;

    String image = provider.bufferShopInfoMini[shop_id].image;
    Widget ShowImage = image == null
        ? Container(
            margin: EdgeInsets.only(right: 10),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          )
        : Container(
            margin: EdgeInsets.only(right: 10),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${HostName()}/image/ImageProfileShop/${image}"))),
          );

    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfffa897b), Colors.white])),
      child: ListView.builder(
          itemCount: bufferChatBox.length,
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            String chatmessage_id = bufferChatBox.keys.toList()[index];
            ChatBox chatBox = bufferChatBox[chatmessage_id];
            int index_after = index - 1;

            if (index_after == -1) {
              return ChatBox_Message(
                chatmessage_id: chatmessage_id,
                chatBox: chatBox,
                ShowImage: ShowImage,
                chatBox_before: null,
              );
            } else {
              String chatmessage_id_before =
                  bufferChatBox.keys.toList()[index - 1];
              ChatBox chatBox_before = bufferChatBox[chatmessage_id_before];
              return ChatBox_Message(
                chatmessage_id: chatmessage_id,
                chatBox: chatBox,
                ShowImage: ShowImage,
                chatBox_before: chatBox_before,
              );
            }
          }),
      // child: ,
    );
  }

  void init() async {
    Map<String, ChatBox> _bufferChatBox = {};
    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    provider.bufferChatBox.forEach((key, value) {
      if (value.chatmanager_id == this.widget.chatmanager_id) {
        _bufferChatBox[key] = value;
      }
    });

    setState(() {
      bufferChatBox = _bufferChatBox;
    });
    await Future.delayed(Duration(milliseconds: 100));
    final double end = controller.position.maxScrollExtent;
    controller.jumpTo(end);
  }

  Future<void> ChatNotify() async {
    SocketioManagerForgound()
        .subscript("chat:${this.widget.chatmanager_id}", Notify);
  }

  Future<void> UnChatNotify() async {
    SocketioManagerForgound().unsubscript("chat:${this.widget.chatmanager_id}");
  }

  void Notify(String message) async {
    Map dataJson = json.decode(message);
    Type5 data = Type5(dataJson: dataJson);
    String chatmessage_id = data.Tochatmessage_id();
    ChatBox chatBox = await data.ToChatBox();

    setState(() {
      bufferChatBox[chatmessage_id] = chatBox;
    });
    await Future.delayed(Duration(milliseconds: 50));
    final double end = controller.position.maxScrollExtent;
    controller.jumpTo(end);
  }
}
