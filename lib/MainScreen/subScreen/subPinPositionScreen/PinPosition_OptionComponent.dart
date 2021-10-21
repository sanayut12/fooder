import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/getGPS.dart';

class PinPosition_OptionComponent extends StatefulWidget {
  final double latitude, longtitude;
  PinPosition_OptionComponent(
      {@required this.latitude, @required this.longtitude});
  @override
  _PinPosition_OptionComponentState createState() =>
      _PinPosition_OptionComponentState();
}

class _PinPosition_OptionComponentState
    extends State<PinPosition_OptionComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonModel(String text, Function fun) => GestureDetector(
          onTap: () {
            fun();
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xfffa897b)),
            child: Text("${text}"),
          ),
        );
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(child: Container()), //ButtonModel("ยกเลิก", CancelPin)
          Expanded(child: ButtonModel("ปักหมุด", ConfirmPin))
        ],
      ),
    );
  }

  Future<void> ConfirmPin() async {
    print("${this.widget.latitude} ${this.widget.longtitude}");
    Navigator.of(context).pop(PositionGPS(
        latitude: this.widget.latitude, longtitude: this.widget.longtitude));
  }

  Future<void> CancelPin() async {
    Navigator.of(context).pop();
  }
}
