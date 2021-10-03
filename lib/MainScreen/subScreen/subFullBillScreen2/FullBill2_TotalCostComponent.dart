import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class FullBill2_TotalCostComponent extends StatefulWidget {
  GetBillFooderDataResponse data;
  FullBill2_TotalCostComponent({@required this.data});
  @override
  _FullBill2_TotalCostComponentState createState() =>
      _FullBill2_TotalCostComponentState();
}

class _FullBill2_TotalCostComponentState
    extends State<FullBill2_TotalCostComponent> {
  @override
  Widget build(BuildContext context) {
    ///////////////////////ส่วนของการประมวลผล/////////////////////////////
    int costSend = this.widget.data.post_info.sendCost; //ค่าจัดส่งสืนค้า
    int totalItem = 0; //ตัวแปรความเงิน

    this.widget.data.bufferItems.forEach((key, value) {
      int cost = this
          .widget
          .data
          .bufferInventory[value.inventory_id]
          .cost; //ราคาของสินค้านั้น
      int quantity = value.quantity;
      totalItem += cost * quantity;
    });
    int costService = ((totalItem + costSend) * 0.1).toInt(); //ราคาค่าบริการ
    /////////////////////////////ส่วนของการแสดงผล///////////////////////////
    TextStyle style1 = TextStyle(fontSize: 12);
    TextStyle style2 = TextStyle(fontSize: 18, fontWeight: FontWeight.w800);
    Widget Box(String text, int value) => Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${text}",
                style: style1,
              ),
              Text(
                "${value}",
                style: style1,
              )
            ],
          ),
        );
    Widget BoxTotal(String text, int value) => Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${text}",
                style: style2,
              ),
              Text(
                "${value} บาท",
                style: style2,
              )
            ],
          ),
        );

    return Container(
      child: Column(
        children: [
          Box("รวมราคาสินค้า", totalItem),
          Box("ค่าจัดส่ง", costSend),
          Box("ส่วนลด", 0),
          Box("ค่าบริการ(10%)", costService),
          BoxTotal("รวมทั้งสิ้น", totalItem + costSend + costService)
        ],
      ),
    );
  }
}
