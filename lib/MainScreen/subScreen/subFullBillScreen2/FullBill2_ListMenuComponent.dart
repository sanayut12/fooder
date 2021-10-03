import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class FullBill2_ListMenuComponent extends StatefulWidget {
  GetBillFooderDataResponse data;
  FullBill2_ListMenuComponent({@required this.data});
  @override
  _FullBill2_ListMenuComponentState createState() =>
      _FullBill2_ListMenuComponentState();
}

class _FullBill2_ListMenuComponentState
    extends State<FullBill2_ListMenuComponent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> ListMenu = [];
    this.widget.data.bufferItems.forEach((key, value) {
      String inventory_id = value.inventory_id;
      String menu_id = this.widget.data.bufferInventory[inventory_id].menu_id;
      String image = this.widget.data.bufferMenu[menu_id].path;
      String name = this.widget.data.bufferMenu[menu_id].name;
      int quantity = value.quantity;
      int cost = this.widget.data.bufferInventory[inventory_id].cost;
      ListMenu.add(
          Menu_box(image: image, name: name, quantity: quantity, cost: cost));
    });
    return Container(
      child: Column(
        children: ListMenu,
      ),
    );
  }
}

class Menu_box extends StatefulWidget {
  String image, name;
  int quantity, cost;
  Menu_box(
      {@required this.image,
      @required this.name,
      @required this.quantity,
      @required this.cost});
  @override
  _Menu_boxState createState() => _Menu_boxState();
}

class _Menu_boxState extends State<Menu_box> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 12);
    Widget Image = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.image}"))),
    );

    Widget Name = Container(
      padding: EdgeInsets.only(left: 5),
      child: Text(
        "${this.widget.name}",
        style: style,
      ),
    );

    Widget Box(int value) => Container(
          alignment: Alignment.center,
          child: Text(
            "${value}",
            style: style,
          ),
        );
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Image, Expanded(child: Name)],
              )),
          Expanded(child: Box(this.widget.quantity)),
          Expanded(child: Box(this.widget.cost)),
          Expanded(child: Box(this.widget.quantity * this.widget.cost)),
        ],
      ),
    );
  }
}
