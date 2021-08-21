import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class BillMenuComponent extends StatefulWidget {
  final ItemBill itemBill;
  final MenuList menuList;

  BillMenuComponent({@required this.itemBill, @required this.menuList});
  @override
  _BillMenuComponentState createState() => _BillMenuComponentState();
}

class _BillMenuComponentState extends State<BillMenuComponent> {
  @override
  Widget build(BuildContext context) {
    Widget NameMenu = Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text("${this.widget.menuList.name}"),
    );

    Widget NumberMenu = Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
          "${this.widget.itemBill.quantity} * ${this.widget.menuList.cost}"),
    );
    Widget TotalMenu = Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
          "${this.widget.itemBill.quantity * this.widget.menuList.cost} บาท"),
    );
    Widget ImageMenu = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.menuList.path}"))),
    );
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          ImageMenu,
          Expanded(child: NameMenu),
          Expanded(child: NumberMenu),
          Expanded(child: TotalMenu)
        ],
      ),
    );
  }
}
