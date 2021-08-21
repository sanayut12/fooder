import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class OneBillItemCommponent extends StatefulWidget {
  final ItemBill itemBill; //data  มี inventory_id
  final MenuList menuList; // data>
  OneBillItemCommponent({@required this.itemBill, @required this.menuList});
  @override
  _OneBillItemCommponentState createState() => _OneBillItemCommponentState();
}

class _OneBillItemCommponentState extends State<OneBillItemCommponent> {
  @override
  Widget build(BuildContext context) {
    Widget ImageMenu = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.menuList.path}"))),
    );
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.green,
      child: Row(
        children: [
          ImageMenu,
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("${this.widget.menuList.name}"),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
                "${this.widget.itemBill.quantity} * ${this.widget.menuList.cost}"),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
                "${this.widget.itemBill.quantity * this.widget.menuList.cost}"),
          )),
        ],
      ),
    );
  }
}
