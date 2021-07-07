import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataOrderMenu.dart';

class MenuCardComponent extends StatefulWidget {
  final String item_id;
  final Menu menu;
  MenuCardComponent({@required this.item_id, @required this.menu});
  @override
  _MenuCardComponentState createState() => _MenuCardComponentState();
}

class _MenuCardComponentState extends State<MenuCardComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ImageMenuComponent = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/menuImage/" +
                  this.widget.menu.menu_image))),
      // child: ,
    );

    Widget DetailMenu = Expanded(
        child: Container(
      // color: Colors.red,
      child: Column(
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              "${this.widget.menu.menu_name}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          )),
          Expanded(
            child: Container(
                child: Text("จำนวน ${this.widget.menu.quantity} ชิ้น")),
          ),
          Expanded(
              child: Container(child: Text("${this.widget.menu.cost} บาท")))
        ],
      ),
    ));

    Widget DeleteMenuButton = Container(
      color: Colors.green,
      width: 50,
      alignment: Alignment.center,
      child: Text("ลบ"),
    );
    return Container(
      height: 100,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.yellow, width: 1)),
      child: Row(
        children: [ImageMenuComponent, DetailMenu, DeleteMenuButton],
      ),
    );
  }
}
