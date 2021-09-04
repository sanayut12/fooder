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

    int menuCost = 3;
    this.widget.data.bufferItem.forEach((element) {
      int quantity = element.quantity;
      String inventory_id = element.inventory_id;
      int cost = this.widget.data.bufferInventory[inventory_id].cost;
      menuCost += quantity * cost;
    });

    TextStyle total_style =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        "รวม ${menuCost + sendCost} บาท",
        style: total_style,
      ),
    );
  }
}
