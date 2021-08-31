import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class Basket2_boxBasketItemComponent extends StatefulWidget {
  final BasketBox_Item item;
  final BasketBox_Inventory inventory;
  final BasketBox_Menu menu;
  Basket2_boxBasketItemComponent({
    @required this.item,
    @required this.inventory,
    @required this.menu,
  });
  @override
  _Basket2_boxBasketItemComponentState createState() =>
      _Basket2_boxBasketItemComponentState();
}

class _Basket2_boxBasketItemComponentState
    extends State<Basket2_boxBasketItemComponent> {
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
    Widget MenuDetail = Container(
      padding: EdgeInsets.only(left: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${this.widget.menu.name}"),
          Text("จำนวน ${this.widget.item.quantity}"),
          Text("ราคาต่อชิ้น ${this.widget.inventory.cost} บาท")
        ],
      ),
    );

    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [MenuImage, Expanded(child: MenuDetail)],
      ),
    );
  }
}
