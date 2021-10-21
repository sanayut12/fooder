import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/FullBillScreen2.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillTrack.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetBillFooderData.dart';
import 'package:fooder/function/http/httpGetBillTrack.dart';

class ChatBox_BillBox extends StatefulWidget {
  ChatBox chatBox;
  ChatBox_BillBox({@required this.chatBox});

  @override
  _ChatBox_BillBoxState createState() => _ChatBox_BillBoxState();
}

class _ChatBox_BillBoxState extends State<ChatBox_BillBox> {
  GetBillTrackResponse bill_track;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetBill();
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    String user_id = UserInfoManagement().User_id();
    String message = this.widget.chatBox.message;
    if (bill_track == null) {
      return Container();
    } else {
      String text_menu = "";
      bill_track.bufferMenu.forEach((key, value) {
        text_menu += "\n ๐${value.name} จำนวน ${value.quantity} ชิ้น";
      });
      return Container(
        margin: EdgeInsets.only(top: 1, bottom: 2),
        padding: EdgeInsets.all(5),
        constraints: BoxConstraints(maxWidth: weight_screen * 0.6),
        decoration: BoxDecoration(
            color: Colors.grey[500].withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: this.widget.chatBox.sender_id == user_id
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
                "จาก เลขที่คำสั่งซื้อ\n${bill_track.bill_id} \nจากโพสต์ \n${bill_track.post.detail} \nสินค้า ${text_menu}"),
            TextButton(
                onPressed: () {
                  OpenFullBillScreen();
                },
                child: Text("เปิด"))
          ],
        ),
      );
    }
  }

  Future<void> GetBill() async {
    GetBillTrackRequest bufferGetBillTrackRequest =
        GetBillTrackRequest(bill_id: this.widget.chatBox.message);
    GetBillTrackResponse _bill_track = await HttpGetBillTrack(
        bufferGetBillTrackRequest: bufferGetBillTrackRequest);
    setState(() {
      bill_track = _bill_track;
    });
  }

  Future<void> OpenFullBillScreen() async {
    GetBillFooderDataRequest bufferGetBillFooderDataRequest =
        GetBillFooderDataRequest(bill_id: this.widget.chatBox.message);
    GetBillFooderDataResponse data =
        await HttpGetBillFooderData(bufferGetBillFooderDataRequest);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FullBillScreen2(data: data)));
  }
}
