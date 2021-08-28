import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataHow_SendBox.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_StatusBar2 extends StatefulWidget {
  final DataPost_PostBox dataPost_PostBox;
  PostBox_StatusBar2({@required this.dataPost_PostBox});
  @override
  _PostBox_StatusBar2State createState() => _PostBox_StatusBar2State();
}

class _PostBox_StatusBar2State extends State<PostBox_StatusBar2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "วิธีการจัดส่ง ${HowSendText(this.widget.dataPost_PostBox.how_send, 'th')}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ปิดการขาย ${this.widget.dataPost_PostBox.stop.ToString()}"),
              Text("ส่ง ${this.widget.dataPost_PostBox.send.ToString()}")
            ],
          ),
        ],
      ),
    );
  }
}
