import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyMenu_OptionBuy extends StatefulWidget {
  final int active;
  final Function setActive;
  BuyMenu_OptionBuy({@required this.active, @required this.setActive});
  @override
  _BuyMenu_OptionBuyState createState() => _BuyMenu_OptionBuyState();
}

class _BuyMenu_OptionBuyState extends State<BuyMenu_OptionBuy> {
  @override
  Widget build(BuildContext context) {
    Widget CancelButton = GestureDetector(
      onTap: () {
        Navigator.of(context).pop(0);
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow,
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text("ยกเลิก"),
      ),
    );
    Widget ShowBuyBar = GestureDetector(
      onTap: () {
        print(
          "object",
        );
        this.widget.setActive(1);
        // setState(() {
        //   this.widget.active = 5;
        // });
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Text("ซื้อ"),
      ),
    );
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.3,
      // margin: EdgeInsets.only(top: 20),
      color: Colors.red,
      child: Row(
        children: [Expanded(child: CancelButton), Expanded(child: ShowBuyBar)],
      ),
    );
  }
}
