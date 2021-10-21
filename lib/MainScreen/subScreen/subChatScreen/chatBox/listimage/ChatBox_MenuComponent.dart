import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetMenuTrack.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class ChatBox_MenuComponent extends StatefulWidget {
  GetMenuTrackResponse menu_track;
  ChatBox_MenuComponent({@required this.menu_track});
  @override
  _ChatBox_MenuComponentState createState() => _ChatBox_MenuComponentState();
}

class _ChatBox_MenuComponentState extends State<ChatBox_MenuComponent> {
  @override
  Widget build(BuildContext context) {
    GetMenuTrackResponse menu_track = this.widget.menu_track;
    double weight_screen = MediaQuery.of(context).size.width;
    double height_screen = MediaQuery.of(context).size.height;
    Widget MessageBox = Container(
      margin: EdgeInsets.only(top: 25),
      width: weight_screen * 0.6,
      // constraints: BoxConstraints(maxWidth: ),
      decoration: BoxDecoration(
          color: Colors.orange[300].withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: weight_screen * 0.12,
            width: weight_screen * 0.12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${HostName()}/image/menuImage/${menu_track.menu.image}"))),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: weight_screen * 0.5),
            child: Text(
                "${menu_track.menu.name} \n ราคา ${menu_track.inventory.cost} บาท"),
          ),
        ],
      ),
    );
    Widget Name = Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 20,
      ),
      child: Text("จากสินค้า"),
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
