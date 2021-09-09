import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullBill_TitleComponent extends StatefulWidget {
  @override
  _FullBill_TitleComponentState createState() =>
      _FullBill_TitleComponentState();
}

class _FullBill_TitleComponentState extends State<FullBill_TitleComponent> {
  @override
  Widget build(BuildContext context) {
    Widget BackButton = GestureDetector(
      onTap: () {
        Back();
      },
      child: Container(
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: MediaQuery.of(context).size.width * 0.1,
        ),
      ),
    );

    Widget TitleText = Container(
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Text(
        "รายละเอียดคำสั่งซื้อ",
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.bold),
      ),
    );
    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      width: double.infinity,
      color: Colors.red,
      child: Row(
        children: [BackButton, TitleText],
      ),
    );
  }

  Future<void> Back() {
    Navigator.of(context).pop();
  }
}
