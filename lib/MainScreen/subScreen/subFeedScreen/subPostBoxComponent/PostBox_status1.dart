import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_StatusBar1 extends StatefulWidget {
  final DataPost_PostBox dataPost_PostBox;
  PostBox_StatusBar1({@required this.dataPost_PostBox});
  @override
  _PostBox_StatusBar1State createState() => _PostBox_StatusBar1State();
}

class _PostBox_StatusBar1State extends State<PostBox_StatusBar1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      width: double.infinity,
      color: Colors.green,
      padding: EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${this.widget.dataPost_PostBox.start.ToString()}"),
          Text(this.widget.dataPost_PostBox.sendCost == 0
              ? "ฟรี"
              : "ค่าจัดส่ง ${this.widget.dataPost_PostBox.sendCost} บาท")
        ],
      ),
    );
  }

  // Future<void> tttt(){
  //   DateTime(year)
  // }
}
