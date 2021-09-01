import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        this.widget.SetHowPay(e);
      },
    );
    return InputHowPay;
  }
}
