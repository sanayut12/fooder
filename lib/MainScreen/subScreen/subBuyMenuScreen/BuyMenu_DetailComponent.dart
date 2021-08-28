import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class BuyMenu_DetailComponent extends StatefulWidget {
  final DataMenu_PostBox dataMenu;
  BuyMenu_DetailComponent({@required this.dataMenu});
  @override
  _BuyMenu_DetailComponentState createState() =>
      _BuyMenu_DetailComponentState();
}

class _BuyMenu_DetailComponentState extends State<BuyMenu_DetailComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Text(this.widget.dataMenu.detail == 'null'
          ? ""
          : " ${this.widget.dataMenu.detail}"),
    );
  }
}
