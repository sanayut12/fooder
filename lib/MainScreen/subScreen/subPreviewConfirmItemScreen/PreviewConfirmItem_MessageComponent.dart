import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PreviewConfirmItem_MessageComponent extends StatefulWidget {
  String comment;
  Function SetText;
  PreviewConfirmItem_MessageComponent(
      {@required this.comment, @required this.SetText});
  @override
  _PreviewConfirmItem_MessageComponentState createState() =>
      _PreviewConfirmItem_MessageComponentState();
}

class _PreviewConfirmItem_MessageComponentState
    extends State<PreviewConfirmItem_MessageComponent> {
  TextEditingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: this.widget.comment);
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "ส่งข้อความถึงร้านค้า",
                style: TextStyle(
                    fontSize: weight_screen * 0.05,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "ใส่ข้อความ 256 ตัวอักษร",
                style: TextStyle(fontSize: 9),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(weight_screen * 0.05),
                border: Border.all(color: Colors.grey[300]),
                color: Colors.white),
            child: TextFormField(
              // maxLength: 10,
              controller: _controller,
              onChanged: (e) {
                this.widget.SetText(e);
              },
              maxLength: 256,
              maxLines: 5,
              minLines: 5,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "ใส่ข้อความ"),
            ),
          ),
        ],
      ),
    );
  }
}
