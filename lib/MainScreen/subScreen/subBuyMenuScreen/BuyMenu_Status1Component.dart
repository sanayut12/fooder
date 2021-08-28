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
    return Container(
      child: Column(
        children: [
          Text("จำนวน ${this.widget.dataInventory.quantity}"),
          Text("ราคา ${this.widget.dataInventory.cost} บาท")
        ],
      ),
    );
  }
}
