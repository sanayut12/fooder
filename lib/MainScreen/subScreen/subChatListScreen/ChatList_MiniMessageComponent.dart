import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class ChatList_MiniMessageComponent extends StatefulWidget {
  ChatBox chatBox;
  ChatList_MiniMessageComponent({@required this.chatBox});
  @override
  _ChatList_MiniMessageComponentState createState() =>
      _ChatList_MiniMessageComponentState();
}

class _ChatList_MiniMessageComponentState
    extends State<ChatList_MiniMessageComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    ChatBox chatBox = this.widget.chatBox;
    DateBox date_start = chatBox.date_send;
    String type_chat = chatBox.type_chat;
    if (type_chat == "1") {
      String message = chatBox.message;
      return Row(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: weight_screen * 0.5),
            child: Text(
              "${message}",
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text("${date_start.hour}:${date_start.min} น.")
        ],
      );
    } else {
      return Container();
    }
  }
}
