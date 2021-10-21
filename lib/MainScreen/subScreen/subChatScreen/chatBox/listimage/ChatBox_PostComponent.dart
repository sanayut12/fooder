import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostTrack.dart';

class ChatBox_PostComponent extends StatefulWidget {
  GetPostTrackResponse post_track;
  final Function fun;

  ChatBox_PostComponent({@required this.post_track, @required this.fun});
  @override
  _ChatBox_PostComponentState createState() => _ChatBox_PostComponentState();
}

class _ChatBox_PostComponentState extends State<ChatBox_PostComponent> {
  @override
  Widget build(BuildContext context) {
    GetPostTrackResponse post_track = this.widget.post_track;
    double weight_screen = MediaQuery.of(context).size.width;
    double height_screen = MediaQuery.of(context).size.height;
    String menu_text = "";
    post_track.bufferMenu.forEach((element) {
      menu_text += "\n  ๐ ${element}";
    });
    Widget MessageBox = Container(
      margin: EdgeInsets.only(top: 25),
      width: weight_screen * 0.6,
      // constraints: BoxConstraints(maxWidth: ),
      decoration: BoxDecoration(
          color: Colors.orange[300].withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Text("${post_track.post_info.detail} ${menu_text}"),
    );
    Widget Name = Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 20,
      ),
      child: Text("จากโพสต์"),
    );

    return Container(
      constraints: BoxConstraints(maxHeight: height_screen * 0.3),
      width: double.infinity,
      color: Colors.white,
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Name,
                  MessageBox,
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
