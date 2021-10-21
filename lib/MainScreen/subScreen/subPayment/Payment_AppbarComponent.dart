import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/module/BackButton.dart';

class Payment_AppbarComponent extends StatefulWidget {
  @override
  _Payment_AppbarComponentState createState() =>
      _Payment_AppbarComponentState();
}

class _Payment_AppbarComponentState extends State<Payment_AppbarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      child: Row(
        children: [
          BackButton21(),
          Text(
            "ชำระสินค้า พร้อมเพย์",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: "SukhumvitSet-Bold"),
          )
        ],
      ),
    );
  }
}
