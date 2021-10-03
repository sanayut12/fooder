import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class FullBill2_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 12, fontWeight: FontWeight.w800);
    Widget Name = Container(
      child: Text(
        "รายการสินค้า",
        style: style,
      ),
    );

    Widget Box(String text) => Container(
          alignment: Alignment.center,
          child: Text("${text}", style: style),
        );
    return Container(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(flex: 3, child: Name),
          Expanded(child: Box("จำนวน")),
          Expanded(child: Box("ราคา")),
          Expanded(child: Box("รวม")),
        ],
      ),
    );
  }
}
