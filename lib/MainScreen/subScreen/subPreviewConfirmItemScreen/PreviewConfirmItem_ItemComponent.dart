import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class PreviewConfirmItem_ItemComponent extends StatefulWidget {
  final BasketBox_Item item;
  final BasketBox_Inventory inventory;
  final BasketBox_Menu menu;
  PreviewConfirmItem_ItemComponent({
    @required this.item,
    @required this.inventory,
    @required this.menu,
  });
  @override
  _PreviewConfirmItem_ItemComponentState createState() =>
      _PreviewConfirmItem_ItemComponentState();
}

class _PreviewConfirmItem_ItemComponentState
    extends State<PreviewConfirmItem_ItemComponent> {
  @override
  Widget build(BuildContext context) {
    Widget MenuImage = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.menu.path}"))),
    );

    // Widget MenuName = ;
    // Widget
    Widget AddQuantity = GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: Icon(Icons.add),
      ),
    );
    Widget MinusQuantity = GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: Icon(Icons.remove),
      ),
    );
    Widget quantityControl = Container(
      child: Row(
        children: [
          MinusQuantity,
          Container(
              margin: EdgeInsets.only(left: 3, right: 3),
              child: Text("${this.widget.item.quantity}")),
          AddQuantity
        ],
      ),
    );
    Widget MenuDetail = Container(
      padding: EdgeInsets.only(left: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${this.widget.menu.name}"),
          Text("ราคาต่อชิ้น ${this.widget.inventory.cost} บาท"),
          quantityControl
        ],
      ),
    );

    Widget DeleteMenu = Container(
      color: Colors.red,
      margin: EdgeInsets.only(top: 1, bottom: 1),
      alignment: Alignment.center,
      child: Text("ลบ"),
    );
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          MenuImage,
          Expanded(flex: 4, child: MenuDetail),
          Expanded(child: DeleteMenu)
        ],
      ),
    );
  }
}
