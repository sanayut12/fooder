import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fooder/MainScreen/subScreen/ChatScreen.dart';
import 'package:fooder/MainScreen/subScreen/subChatListScreen/ChatList_MiniMessageComponent.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class ChatList_BoxComponent extends StatefulWidget {
  String chatmanager_id;
  ChatList_BoxComponent({@required this.chatmanager_id});
  @override
  _ChatList_BoxComponentState createState() => _ChatList_BoxComponentState();
}

class _ChatList_BoxComponentState extends State<ChatList_BoxComponent> {
  @override
  Widget build(BuildContext context) {
    String chatmanager_id = this.widget.chatmanager_id;
    return Consumer(
        builder: (context, DataManagementProvider provider, Widget child) {
      Map<String, ChatManager> bufferChatmanager =
          provider.bufferChatmanager; //< chatmanager_id, data>
      String shop_id = bufferChatmanager[chatmanager_id].shop_id;
      Map<String, ShopProfileMini> bufferUsers = provider.bufferShopInfoMini;
      String name = bufferUsers[shop_id].name;
      String image = bufferUsers[shop_id].image;
      //////////// แสดงข้อความล่าสุดของร้านนั้นๆ///
      Map<String, ChatBox> bufferChatBox = {};
      provider.bufferChatBox.forEach((key, value) {
        if (value.chatmanager_id == chatmanager_id) {
          bufferChatBox[key] = value;
        }
      });

      int index_chat = bufferChatBox.length;
      String chatmessage_id = bufferChatBox.keys.toList()[index_chat - 1];
      ChatBox chatBox = bufferChatBox[chatmessage_id];
      //////////////////////
      Widget ShowImage = Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "${HostName()}/image/ImageProfileShop/${image}"))),
      );

      Widget ShowName = Container(
        child: Text(
          "${name}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      );
      return GestureDetector(
        onTap: () {
          OpenChatScreen();
        },
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[100].withOpacity(0.3)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShowImage,
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowName,
                      ChatList_MiniMessageComponent(chatBox: chatBox)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Future<void> OpenChatScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            ChatScreen(chatmanager_id: this.widget.chatmanager_id)));
  }
}
