import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/messagetype/ChatBox_BillBox.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/messagetype/ChatBox_ImageBox.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/messagetype/ChatBox_MenuBox.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/messagetype/ChatBox_MessageBox.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/messagetype/ChatBox_PostBox.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class ChatBox_TypeMessageComponent extends StatefulWidget {
  ChatBox chatBox;
  ChatBox_TypeMessageComponent({@required this.chatBox});
  @override
  _ChatBox_TypeMessageComponentState createState() =>
      _ChatBox_TypeMessageComponentState();
}

class _ChatBox_TypeMessageComponentState
    extends State<ChatBox_TypeMessageComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    ChatBox chatBox = this.widget.chatBox;

    DateBox date_send = chatBox.date_send;
    String type_chat = chatBox.type_chat;

    ///การสร้างวันที่
    int hour = date_send.getHour();
    int min = date_send.getMinute();
    String date_send_string = "${hour}:${min}น.";
    Widget ShowDate = Text(
      date_send_string,
      style: TextStyle(fontSize: 8),
    );

    ///การจัดตำแหน่ง
    MainAxisAlignment positionmessage = MainAxisAlignment.start;
    String user_id = UserInfoManagement().User_id();

    if (user_id == chatBox.sender_id) {
      positionmessage = MainAxisAlignment.end;
    }
    if (type_chat == "1") {
      return Container(
        // color: Colors.red,
        width: weight_screen * 0.8,
        child: Container(
          child: Row(
            mainAxisAlignment: positionmessage,
            children: [
              user_id != chatBox.sender_id ? Container() : ShowDate,
              ChatBox_MessageBox(chatBox: chatBox),
              user_id == chatBox.sender_id ? Container() : ShowDate,
            ],
          ),
        ),
        // child: ,
      );
    } else if (type_chat == "3") {
      return Container(
        // color: Colors.red,
        width: weight_screen * 0.8,
        child: Container(
          child: Row(
            mainAxisAlignment: positionmessage,
            children: [
              user_id != chatBox.sender_id ? Container() : ShowDate,
              ChatBox_ImageBox(chatBox: chatBox),
              user_id == chatBox.sender_id ? Container() : ShowDate,
            ],
          ),
        ),
      );
    } else if (type_chat == "6") {
      return Container(
        // color: Colors.red,
        width: weight_screen * 0.8,
        child: Container(
          child: Row(
            mainAxisAlignment: positionmessage,
            children: [
              user_id != chatBox.sender_id ? Container() : ShowDate,
              ChatBox_BillBox(chatBox: chatBox),
              user_id == chatBox.sender_id ? Container() : ShowDate,
            ],
          ),
        ),
      );
    } else if (type_chat == "5") {
      return Container(
        // color: Colors.red,
        width: weight_screen * 0.8,
        child: Container(
          child: Row(
            mainAxisAlignment: positionmessage,
            children: [
              user_id != chatBox.sender_id ? Container() : ShowDate,
              ChatBox_PostBox(chatBox: chatBox),
              user_id == chatBox.sender_id ? Container() : ShowDate,
            ],
          ),
        ),
      );
    } else if (type_chat == "4") {
      return Container(
        // color: Colors.red,
        width: weight_screen * 0.8,
        child: Container(
          child: Row(
            mainAxisAlignment: positionmessage,
            children: [
              user_id != chatBox.sender_id ? Container() : ShowDate,
              ChatBox_MenuBox(chatBox: chatBox),
              user_id == chatBox.sender_id ? Container() : ShowDate,
            ],
          ),
        ),
      );
    } else {
      return Container(
        // color: Colors.red,
        width: weight_screen * 0.8,
        child: Container(
          child: Row(
            mainAxisAlignment: positionmessage,
            children: [
              user_id != chatBox.sender_id ? Container() : ShowDate,
              ChatBox_MessageBox(chatBox: chatBox),
              user_id == chatBox.sender_id ? Container() : ShowDate,
            ],
          ),
        ),
      );
    }
  }
}
