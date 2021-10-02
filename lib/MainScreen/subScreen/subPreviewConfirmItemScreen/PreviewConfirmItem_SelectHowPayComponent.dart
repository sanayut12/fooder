import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PreviewConfirmItem_SelectHowPayComponent extends StatefulWidget {
  final String how_pay;
  final Function SetHowPay;
  PreviewConfirmItem_SelectHowPayComponent(
      {@required this.how_pay, @required this.SetHowPay});
  @override
  _PreviewConfirmItem_SelectHowPayComponentState createState() =>
      _PreviewConfirmItem_SelectHowPayComponentState();
}

class _PreviewConfirmItem_SelectHowPayComponentState
    extends State<PreviewConfirmItem_SelectHowPayComponent> {
  Map<String, Map<String, String>> bufferHowSend = {
    '1': {
      'th': 'ชำระผ่านพร้อมเพย์',
      'en': 'promptpay ',
    },
    '2': {
      'th': 'ชำระปลายทาง',
      'en': 'take home',
    }
  };
  List<String> ListHowPay = ['1', '2'];
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    List<DropdownMenuItem<String>> ItemHowPay =
        ListHowPay.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text('${bufferHowSend[value]["th"]}'),
      );
    }).toList();

    Widget InputHowPay = DropdownButton<String>(
      value: this.widget.how_pay,
      items: ItemHowPay,
      hint: Text(
        "เลือกวิธีการชำระสินค้า",
        style: TextStyle(color: Colors.grey[500], fontSize: 16),
      ),
      onChanged: (e) {
        this.widget.SetHowPay(e);
      },
    );
    return Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "วิธีการชำระสินค้า",
              style: TextStyle(
                  fontSize: weight_screen * 0.05, fontWeight: FontWeight.bold),
            ),
            InputHowPay,
          ],
        ));
  }
}
