import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillTrack.dart';

class ChatBox_BillComponent extends StatefulWidget {
  GetBillTrackResponse bill_track;
  ChatBox_BillComponent({@required this.bill_track});

  @override
  _ChatBox_BillComponentState createState() => _ChatBox_BillComponentState();
}

class _ChatBox_BillComponentState extends State<ChatBox_BillComponent> {
  @override
  Widget build(BuildContext context) {
    GetBillTrackResponse bill_track = this.widget.bill_track;
    double weight_screen = MediaQuery.of(context).size.width;
    double height_screen = MediaQuery.of(context).size.height;
    Widget MessageBox = Container(
      margin: EdgeInsets.only(top: 25),
      width: weight_screen * 0.6,
      decoration: BoxDecoration(
          color: Colors.orange[300].withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: weight_screen * 0.5),
        child: Text("เลขที่คำสั่งซื้อ\n${bill_track.bill_id}"),
      ),
    );
    Widget Name = Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 20,
      ),
      child: Text("จากบิล"),
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
