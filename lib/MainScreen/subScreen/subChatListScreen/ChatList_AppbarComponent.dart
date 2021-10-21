import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatList_AppbarComponent extends StatefulWidget {
  @override
  _ChatList_AppbarComponentState createState() =>
      _ChatList_AppbarComponentState();
}

class _ChatList_AppbarComponentState extends State<ChatList_AppbarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonBack = GestureDetector(
        onTap: () {
          Back();
        },
        child: Container(
          height: 65,
          width: 65,
          alignment: Alignment.center,
          child: Icon(Icons.arrow_back_ios),
        ));
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [
          ButtonBack,
          Text(
            "แชท",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "SukhumvitSet-Bold",
                color: Colors.white),
          )
        ],
      ),
    );
  }

  Future<void> Back() async {
    Navigator.of(context).pop();
  }
}
