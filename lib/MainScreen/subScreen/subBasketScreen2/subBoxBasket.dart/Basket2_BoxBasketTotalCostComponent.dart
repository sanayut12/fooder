import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class Basket2_BoxBasketTotalCostComponent extends StatefulWidget {
  final GetItemInBasket_ItemsResponse data;
  Basket2_BoxBasketTotalCostComponent({@required this.data});

  @override
  _Basket2_BoxBasketTotalCostComponentState createState() =>
      _Basket2_BoxBasketTotalCostComponentState();
}

class _Basket2_BoxBasketTotalCostComponentState
    extends State<Basket2_BoxBasketTotalCostComponent> {
  @override
  Widget build(BuildContext context) {
    int sendCost = this.widget.data.post_info.sendCost;

    int menuCost = 0;
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
