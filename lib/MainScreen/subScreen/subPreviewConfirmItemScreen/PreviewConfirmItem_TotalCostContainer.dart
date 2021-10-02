import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class PreviewConfirmItem_TotalCostContainer extends StatefulWidget {
  final GetItemInBasket_ItemsResponse data;
  PreviewConfirmItem_TotalCostContainer({@required this.data});

  @override
  _PreviewConfirmItem_TotalCostContainerState createState() =>
      _PreviewConfirmItem_TotalCostContainerState();
}

class _PreviewConfirmItem_TotalCostContainerState
    extends State<PreviewConfirmItem_TotalCostContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("${this.widget.data.post_info.post_id}");
  }

  @override
  Widget build(BuildContext context) {
    int sendCost = this.widget.data.post_info.sendCost;

    int menuCost = 0;
    this.widget.data.bufferItem.forEach((key, value) {
      int quantity = value.quantity;
      String inventory_id = value.inventory_id;
      int cost = this.widget.data.bufferInventory[inventory_id].cost;
      menuCost += quantity * cost;
    });
    // this.widget.data.bufferItem.forEach((element) {

    // });

    TextStyle total_style =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    int costService = ((menuCost + sendCost) * 0.1).toInt();
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("รวมราคาสินค้า"), Text("${menuCost}")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("ค่าจัดส่ง"), Text("${sendCost}")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ส่วนลด"),
                    Text("0"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("ค่าบริการ(10%)"), Text("${costService}")],
                ),
                Text(
                  "รวม ${menuCost + sendCost + costService} บาท",
                  style: total_style,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
