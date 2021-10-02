import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyMenu_OptionUser extends StatefulWidget {
  final Function CallAddBaseket, CallBuyNow;
  BuyMenu_OptionUser(
      {@required this.CallBuyNow, @required this.CallAddBaseket});
  @override
  _BuyMenu_OptionUserState createState() => _BuyMenu_OptionUserState();
}

class _BuyMenu_OptionUserState extends State<BuyMenu_OptionUser> {
  TextEditingController textComment;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double weight = MediaQuery.of(context).size.width;

    // Widget ButtonModel(String text, Function _call) => ;

    return Container(
      height: weight * 0.2,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ButtonModel(
                      text: "เพิ่มลงตะกล้า", fun: this.widget.CallAddBaseket)),
              Expanded(
                  child:
                      ButtonModel(text: "ซื้อเลย", fun: this.widget.CallBuyNow))
            ],
          )),
        ],
      ),
    );
  }
}

class ButtonModel extends StatefulWidget {
  String text;
  Function fun;
  ButtonModel({@required this.text, @required this.fun});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  Color color = Colors.yellow[500];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.white;
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Colors.yellow[500];
        });
        this.widget.fun();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        alignment: Alignment.center,
        child: Text("${this.widget.text}"),
      ),
    );
  }
}
