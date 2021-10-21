import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviewConfirmItem_OptionBarComponent extends StatefulWidget {
  Function fun;
  int active;
  PreviewConfirmItem_OptionBarComponent(
      {@required this.fun, @required this.active});
  @override
  _PreviewConfirmItem_OptionBarComponentState createState() =>
      _PreviewConfirmItem_OptionBarComponentState();
}

class _PreviewConfirmItem_OptionBarComponentState
    extends State<PreviewConfirmItem_OptionBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      width: double.infinity,
      // color: Color(0xfffa897b),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
              child: ButtonModel(
                  text: "ยืนยันคำสั่งซื้อ",
                  fun: this.widget.fun,
                  active: this.widget.active))
        ],
      ),
    );
  }

  Future<void> Back() {
    Navigator.of(context).pop();
  }
}

class PreviewConfirmItem_return {
  final String how_pay;
  final String bill_id;
  PreviewConfirmItem_return({@required this.bill_id, @required this.how_pay});
}

class ButtonModel extends StatefulWidget {
  String text;
  Function fun;
  int active;
  ButtonModel({@required this.text, @required this.fun, @required this.active});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  @override
  Widget build(BuildContext context) {
    //  Widget ButtonModel(String text, Function func, int act) => ;
    return GestureDetector(
      onTap: () {
        if (this.widget.active == 1) {
          this.widget.fun();
        }
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(20),
            color: this.widget.active == 1 ? Color(0xfffa897b) : Colors.white),
        child: Text("${this.widget.text}"),
      ),
    );
  }
}
