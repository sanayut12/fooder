import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class PreviewConfirmItem_OptionBarComponent extends StatefulWidget {
  final String how_send;
  final String address_select;
  final String how_pay;
  final int active;
  final GetItemInBasket_ItemsResponse data;
  PreviewConfirmItem_OptionBarComponent(
      {@required this.how_send,
      @required this.address_select,
      @required this.how_pay,
      @required this.active,
      @required this.data});
  @override
  _PreviewConfirmItem_OptionBarComponentState createState() =>
      _PreviewConfirmItem_OptionBarComponentState();
}

class _PreviewConfirmItem_OptionBarComponentState
    extends State<PreviewConfirmItem_OptionBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonModel(String text, Function fun, int act) => GestureDetector(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: act == 1 ? Colors.red : Colors.white),
            child: Text("${text}"),
          ),
        );
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      color: Colors.pink,
      child: Row(
        children: [
          Expanded(child: ButtonModel("กลับ", null, 1)),
          Expanded(
              child: ButtonModel("ยืนยันคำสั่งซื้อ", null, this.widget.active))
        ],
      ),
    );
  }
}
