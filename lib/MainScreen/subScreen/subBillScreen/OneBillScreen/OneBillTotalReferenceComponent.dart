import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';

class OneBillTotalReferenceComponent extends StatefulWidget {
  final Bill bill;
  final Map<String, ItemBill> bufferItemBill; //<item_id ,data>
  final Map<String, MenuList> bufferMenuList; //<inventory_id , data>
  OneBillTotalReferenceComponent(
      {@required this.bill,
      @required this.bufferItemBill,
      @required this.bufferMenuList});
  @override
  _OneBillTotalReferenceComponentState createState() =>
      _OneBillTotalReferenceComponentState();
}

class _OneBillTotalReferenceComponentState
    extends State<OneBillTotalReferenceComponent> {
  int itemcost = 0;
  int total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSetValue();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.red,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("ยอดทั้งหมด"), Text("${itemcost} บาท")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ค่าจัดส่ง"),
              Text("${this.widget.bill.sendCost} บาท")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("ส่วนลด"), Text("0 บาท")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("ยอดรวม"), Text("${total} บาท")],
          )
        ],
      ),
    );
  }

  void initSetValue() async {
    setState(() {
      this.widget.bufferItemBill.forEach((key, value) {
        // value.inventory_id;
        int cost = this.widget.bufferMenuList[value.inventory_id].cost;
        int quantity = value.quantity;

        itemcost += cost * quantity;
      });

      total = itemcost + this.widget.bill.sendCost;
    });
  }
}
