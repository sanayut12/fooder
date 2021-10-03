import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FillBill2_Appbar extends StatefulWidget {
  @override
  _FillBill2_AppbarState createState() => _FillBill2_AppbarState();
}

class _FillBill2_AppbarState extends State<FillBill2_Appbar> {
  @override
  Widget build(BuildContext context) {
    Widget BackButton = GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
          height: 65,
          width: 65,
          alignment: Alignment.center,
          child: Icon(Icons.arrow_back_ios)),
    );
    return Container(
      height: 65,
      width: double.infinity,
      child: Row(
        children: [BackButton, Text("รายละเอียดคำสั่งซื้อ")],
      ),
    );
  }
}
