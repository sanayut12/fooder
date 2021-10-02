import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/htttpObjectGetItemQuantity.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/http/htttpGetItemQuantity.dart';
import 'package:fooder/module/socketioManagerForgound.dart';

class BuyMenu_Status1Component extends StatefulWidget {
  String inventory_id;
  final DataInventory_PostBox dataInventory;
  BuyMenu_Status1Component(
      {@required this.inventory_id, @required this.dataInventory});
  @override
  _BuyMenu_Status1ComponentState createState() =>
      _BuyMenu_Status1ComponentState();
}

class _BuyMenu_Status1ComponentState extends State<BuyMenu_Status1Component> {
  int quantity_buyed = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetItemQuantity();
    SocketioManagerForgound().subscript(
        "notify-invetory-quantity:${this.widget.inventory_id}",
        SetQuantity_Buyed);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SocketioManagerForgound()
        .unsubscript("notify-invetory-quantity:${this.widget.inventory_id}");
  }

  @override
  Widget build(BuildContext context) {
    TextStyle quantity_Style = TextStyle(fontSize: 20);
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("จำนวน ${this.widget.dataInventory.quantity}",
                  style: quantity_Style),
              Text(
                  "คงเหลือ ${this.widget.dataInventory.quantity - quantity_buyed} ",
                  style: quantity_Style),
            ],
          ),
          Text(
            "ราคา ${this.widget.dataInventory.cost} บาท",
            style: quantity_Style,
          )
        ],
      ),
    );
  }

  Future<void> SetQuantity_Buyed(String message) {
    Map data = jsonDecode(message);
    int quantity = data['quantity'];
    print(data);
    setState(() {
      quantity_buyed = quantity;
    });
  }

  Future<void> GetItemQuantity() async {
    String inventory_id = this.widget.inventory_id;
    GetItemQuantityRequest bufferGetItemQuantityRequest =
        GetItemQuantityRequest(inventory_id: inventory_id);
    GetItemQuantityResponse bufferGetItemQuantityResponse =
        await HttpGetItemQuantity(bufferGetItemQuantityRequest);

    setState(() {
      quantity_buyed = bufferGetItemQuantityResponse.quantity;
    });
  }
}
