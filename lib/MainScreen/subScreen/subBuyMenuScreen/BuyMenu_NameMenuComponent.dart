import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class BuyMenu_NameMenuComponent extends StatefulWidget {
  final DataMenu_PostBox dataMenu;
  BuyMenu_NameMenuComponent({@required this.dataMenu});
  @override
  _BuyMenu_NameMenuComponentState createState() =>
      _BuyMenu_NameMenuComponentState();
}

class _BuyMenu_NameMenuComponentState extends State<BuyMenu_NameMenuComponent> {
  @override
  Widget build(BuildContext context) {
    TextStyle MenuNameStyle = TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.1,
        fontWeight: FontWeight.bold);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.2,
      color: Colors.red,
      alignment: Alignment.center,
      child: Text(
        "${this.widget.dataMenu.name}",
        style: MenuNameStyle,
      ),
    );
  }
}
