import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class BuyMenu_AppbarComponent extends StatefulWidget {
  final String name;
  BuyMenu_AppbarComponent({@required this.name});
  @override
  _BuyMenu_AppbarComponentState createState() =>
      _BuyMenu_AppbarComponentState();
}

class _BuyMenu_AppbarComponentState extends State<BuyMenu_AppbarComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    Widget BackButton = IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));
    Widget Title = Container(
      alignment: Alignment.center,
      child: Text(
        "${this.widget.name}",
        style: TextStyle(
            fontSize: weight_screen * 0.05, fontWeight: FontWeight.w800),
      ),
    );
    return Container(
      height: weight_screen * 0.15,
      width: double.infinity,
      color: Colors.transparent, // Color(0xfffa897b)
      child: Row(
        children: [BackButton], //, Expanded(child: Title)
      ),
    );
  }
}
