import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/ChatBox_TypeMessageComponent.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:provider/provider.dart';

class ChatBox_Message extends StatefulWidget {
  String chatmessage_id;
  ChatBox chatBox, chatBox_before;
  Widget ShowImage;
  ChatBox_Message(
      {@required this.chatmessage_id,
      @required this.chatBox,
      @required this.ShowImage,
      @required this.chatBox_before});
  @override
  _ChatBox_MessageState createState() => _ChatBox_MessageState();
}

class _ChatBox_MessageState extends State<ChatBox_Message> {
  @override
  Widget build(BuildContext context) {
    bool check_profile = false;

    //ส่วนของการประมวลผล/////
    DateBox date_now =
        DateStringTransformInt(dateString: DateTime.now().toString());
    String user_id = UserInfoManagement().User_id();
    String chatmessage_id = this.widget.chatmessage_id;
    ChatBox chatBox = this.widget.chatBox;
    ChatBox chatBox_before = this.widget.chatBox_before;

    DateBox date_send = chatBox.date_send;

    int year = date_send.getYear();
    int month = date_send.getMonth();
    int day = date_send.getDay();
    int hour = date_send.getHour();
    int min = date_send.getMinute();

    ///ส่วนของการแสดงผล///////
    Widget ShowImage = this.widget.ShowImage;
    //จัดตำแหน่งของกล่องข้อความ ถ้าคนส่งเป็นตัวเองต้องชิดขวา ถ้าคนส่งเป็นคนอื่นให้ชิดซ้าย
    MainAxisAlignment positionmessage = MainAxisAlignment.end;
    if (user_id != chatBox.sender_id) {
      positionmessage = MainAxisAlignment.start;
    }
    if (chatBox_before == null) {
      //ตัวบนสุดของแชต

      String date_string = "";
      if (year < date_now.getYear()) {
        date_string = date_string + " ${year}";
      }
      date_string = "${day} ${month}" + date_string;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text("${date_string}"),
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: positionmessage,
              children: [
                check_profile
                    ? ShowImage
                    : Container(
                        width: 35,
                      ),
                ChatBox_TypeMessageComponent(chatBox: chatBox),
              ],
            ),
          ),
        ],
      );
    } else {
      //ตัวต่อไปจนสุดท้าย

      //ทำการแสดงวันที่ หาก วันที่กับ chatbox ของอันก่อนหน้าต่างกัน
      DateBox date_send_before = chatBox_before.date_send;
      int year_before = date_send_before.getYear();
      int month_before = date_send_before.getMonth();
      int day_before = date_send_before.getDay();
      int hour_before = date_send_before.getHour();
      int min_before = date_send_before.getMinute();
      // print(
      //     "${year_before} ${year} ${year_before != year} :   ${month_before} ${month} ${month_before != month} :  ${day_before}  ${day} ${day_before != day}  ");
      String show_date_now = "";
      if (year_before != year || month_before != month || day_before != day) {
        if (year < date_now.getYear()) {
          show_date_now = "${year}";
        }
        show_date_now = "${day} ${month}" + show_date_now;
        if (date_now.getYear() == year &&
            date_now.getMonth() == month &&
            date_now.getDay() == day) {
          show_date_now = "วันนี้";
        }
      } //ทำการแสดงวันที่ หาก วันที่กับ chatbox ของอันก่อนหน้าต่างกัน จบ

      //การแสดง รูปโปรไฟล์
      // print(
      //     "${user_id} ${chatBox.sender_id} ${user_id != chatBox.sender_id} || ${hour} ${hour_before} ${hour != hour_before} || ${min} ${min_before} ${min != min_before}");
      if (user_id != chatBox.sender_id &&
          chatBox.sender_id != chatBox_before.sender_id) {
        check_profile = true;
      } else if (user_id != chatBox.sender_id &&
          hour == hour_before &&
          min != min_before) {
        check_profile = true;
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          show_date_now.length == 0
              ? Container(
                  width: 35,
                )
              : Text("${show_date_now}"),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: positionmessage,
              children: [
                check_profile
                    ? ShowImage
                    : Container(
                        width: 35,
                        margin: EdgeInsets.only(right: 10),
                      ),
                ChatBox_TypeMessageComponent(chatBox: chatBox),
              ],
            ),
          ),
        ],
      );
    }
  }
}
