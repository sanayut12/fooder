import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class PreviewConfirmItem_SelectHowSendComponent extends StatefulWidget {
  final String how_send;
  final GetItemInBasket_ItemsResponse data;
  final Function SetHowSend;
  PreviewConfirmItem_SelectHowSendComponent(
      {@required this.how_send,
      @required this.data,
      @required this.SetHowSend});
  @override
  _PreviewConfirmItem_SelectHowSendComponentState createState() =>
      _PreviewConfirmItem_SelectHowSendComponentState();
}

class _PreviewConfirmItem_SelectHowSendComponentState
    extends State<PreviewConfirmItem_SelectHowSendComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    Widget SendAt = Container(
      child: Row(
        children: [
          Radio(
              value: "1",
              groupValue: this.widget.how_send,
              onChanged: (e) {
                print(e);
                this.widget.SetHowSend(e);
              }),
          Text("ส่งถึงที่")
        ],
      ),
    );
    Widget RecieveShop = Container(
      child: Row(
        children: [
          Radio(
              value: "2",
              groupValue: this.widget.how_send,
              onChanged: (e) {
                print(e);
                this.widget.SetHowSend(e);
              }),
          Text("รับที่ร้าน")
        ],
      ),
    );

    List<Widget> listRadio = [];
    if (this.widget.data.post_info.how_send == "1") {
      listRadio = [SendAt];
    } else if (this.widget.data.post_info.how_send == "2") {
      listRadio = [RecieveShop];
    } else if (this.widget.data.post_info.how_send == "3") {
      listRadio = [SendAt, RecieveShop];
    }
    return Container(
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "วิธีการจัดส่ง",
            style: TextStyle(
                fontSize: weight_screen * 0.05, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listRadio,
          ),
        ],
      ),
    );
  }
}
