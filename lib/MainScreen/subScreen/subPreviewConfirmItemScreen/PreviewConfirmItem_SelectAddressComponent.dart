import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/CreateAddressUserScreen.dart';

class PreviewConfirmItem_SelectAddressComponent extends StatefulWidget {
  // final String how_send;

  @override
  _PreviewConfirmItem_SelectAddressComponentState createState() =>
      _PreviewConfirmItem_SelectAddressComponentState();
}

class _PreviewConfirmItem_SelectAddressComponentState
    extends State<PreviewConfirmItem_SelectAddressComponent> {
  @override
  Widget build(BuildContext context) {
    Widget OpenAddressUser = GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => CreateAddressUserScreen()));
      },
      child: Container(
        height: 100,
        alignment: Alignment.center,
        color: Colors.red,
        child: Text("เพิ่มที่อยู่"),
      ),
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("เลือกที่อยู่การจัดส่ง"),
          Row(
            children: [
              Expanded(flex: 5, child: Container()),
              Expanded(child: OpenAddressUser),
            ],
          )
        ],
      ),
    );
  }
}
