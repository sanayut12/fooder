import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class BuyMenu_Status1Component extends StatefulWidget {
  final DataInventory_PostBox dataInventory;
  BuyMenu_Status1Component({@required this.dataInventory});
  @override
  _BuyMenu_Status1ComponentState createState() =>
      _BuyMenu_Status1ComponentState();
}

class _BuyMenu_Status1ComponentState extends State<BuyMenu_Status1Component> {
  @override
  Widget build(BuildContext context) {
    TextStyle quantity_Style = TextStyle(fontSize: 20);
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("จำนวน ${this.widget.dataInventory.quantity}",
              style: quantity_Style),
          Text(
            "ราคา ${this.widget.dataInventory.cost} บาท",
            style: quantity_Style,
          )
        ],
      ),
    );
  }
}
