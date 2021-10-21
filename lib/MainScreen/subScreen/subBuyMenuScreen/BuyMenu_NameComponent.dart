import 'package:flutter/cupertino.dart';

class BuyMenu_NameComponent extends StatefulWidget {
  String name;
  BuyMenu_NameComponent({@required this.name});
  @override
  _BuyMenu_NameComponentState createState() => _BuyMenu_NameComponentState();
}

class _BuyMenu_NameComponentState extends State<BuyMenu_NameComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        "${this.widget.name}",
        style: TextStyle(
            fontSize: weight_screen * 0.1, fontFamily: "SukhumvitSet-Bold"),
      ),
    );
  }
}
