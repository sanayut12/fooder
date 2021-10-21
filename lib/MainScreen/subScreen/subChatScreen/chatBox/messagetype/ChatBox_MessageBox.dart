import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';

class ChatBox_MessageBox extends StatefulWidget {
  ChatBox chatBox;
  ChatBox_MessageBox({@required this.chatBox});
  @override
  _ChatBox_MessageBoxState createState() => _ChatBox_MessageBoxState();
}

class _ChatBox_MessageBoxState extends State<ChatBox_MessageBox> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    String message = this.widget.chatBox.message;
    return Container(
      margin: EdgeInsets.only(top: 1, bottom: 2),
      padding: EdgeInsets.all(5),
      constraints: BoxConstraints(maxWidth: weight_screen * 0.6),
      decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),
          borderRadius: BorderRadius.circular(5)),
      child: Text("${message}"),
    );
  }
}
