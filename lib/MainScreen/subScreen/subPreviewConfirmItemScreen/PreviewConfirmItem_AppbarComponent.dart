import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviewConfirmItem_AppbarComponent extends StatefulWidget {
  @override
  _PreviewConfirmItem_AppbarComponentState createState() =>
      _PreviewConfirmItem_AppbarComponentState();
}

class _PreviewConfirmItem_AppbarComponentState
    extends State<PreviewConfirmItem_AppbarComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      height: weight_screen * 0.15,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          Expanded(
              child: Text(
            "ยืนยันการชำระสินค้า",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "SukhumvitSet-Bold",
                color: Colors.white),
          ))
        ],
      ),
    );
  }
}


// Container(
//                   margin: EdgeInsets.only(
//                       top: weight_screen * 0.02,
//                       bottom: weight_screen * 0.02,
//                       left: weight_screen * 0.05,
//                       right: weight_screen * 0.1),
//                   height: double.infinity,
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius:
//                           BorderRadius.circular(weight_screen * 0.05)),
//                   child: Text("ยืนยันการชำระสินค้า"))