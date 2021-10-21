import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/Chat_AppBarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/Chat_BottomComponent.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/Chat_ListMessage.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  String chatmanager_id, type_chat, message;
  ChatScreen({@required this.chatmanager_id, this.type_chat, this.message});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String data = "";
  Map<String, ChatBox> bufferChat = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SubMessage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    UnSubMessage();
  }

  @override
  Widget build(BuildContext context) {
    String chatmanager_id = this.widget.chatmanager_id;
    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    String shop_id = provider.bufferChatmanager[chatmanager_id].shop_id;
    return Scaffold(
      body: Container(
        color: Color(0xfffa897b),
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
            child: Column(
          children: [
            Chat_AppBarComponent(
              chatmanager_id: chatmanager_id,
            ),
            // Expanded(child: Container()),
            Expanded(
              child: Chat_ListMessage(chatmanager_id: chatmanager_id),
              // child: Container(
              //   height: double.infinity,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           colors: [Color(0xfffa897b), Colors.white])),
              //   child: ListView.builder(
              //       itemCount: bufferChat.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         String chatmessage_id = bufferChat.keys.toList()[index];
              //         String message = bufferChat[chatmessage_id].message;
              //         return Text(message);
              //       }),
              // ),
            ),
            Chat_BottomComponent(
              chatmanager_id: this.widget.chatmanager_id,
              shop_id: shop_id,
              message: this.widget.message,
              type_chat: this.widget.type_chat,
            )
          ],
        )),
      ),
    );
  }

  Future<void> SubMessage() async {
    // String chatmanager_id = this.widget.data.chatmanager_id;
    // SocketioManagerForgound()
    //     .subscript("chatscreen:${chatmanager_id}", reciveMessage);
  }

  Future<void> reciveMessage(String message) async {
    Map dataJson = json.decode(message);
    String chatmessage_id = dataJson['chatmessage_id'];
    TranformChatBox chatBox = TranformChatBox(jsonString: message);
    ChatBox chat = await chatBox.chatbox();
    setState(() {
      bufferChat[chatmessage_id] = chat;
    });
  }

  Future<void> UnSubMessage() async {
    // String chatmanager_id = this.widget.data.chatmanager_id;
    // SocketioManagerForgound().unsubscript("chatscreen:${chatmanager_id}");
  }
}
