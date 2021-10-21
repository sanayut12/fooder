import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyMenu_OptionUser extends StatefulWidget {
  final Function CallAddBaseket, CallBuyNow, CallChat;
  BuyMenu_OptionUser(
      {@required this.CallBuyNow,
      @required this.CallAddBaseket,
      @required this.CallChat});
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfffa897b), Colors.white])),
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Row(
                children: [
                  Button2Model(
                      text: "ทักแชท",
                      icon: Icons.chat,
                      fun: this.widget.CallChat),
                  Button2Model(
                      text: "เพิ่มลงตะกร้า",
                      icon: Icons.local_mall,
                      fun: this.widget.CallAddBaseket)
                  // Expanded(
                  //     child: ButtonModel(
                  //         text: "เพิ่มลงตะกล้า",
                  //         fun: this.widget.CallAddBaseket)),
                ],
              ),
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

class Button2Model extends StatefulWidget {
  String text;
  IconData icon;
  final Function fun;
  Button2Model({@required this.text, @required this.icon, @required this.fun});

  @override
  _Button2ModelState createState() => _Button2ModelState();
}

class _Button2ModelState extends State<Button2Model> {
  @override
  Widget build(BuildContext context) {
    double weight = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        this.widget.fun();
      },
      child: Container(
        width: weight * 0.2,
        height: weight * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(this.widget.icon),
            Text(
              "${this.widget.text}",
              style: TextStyle(fontSize: weight * 0.03),
            ),
          ],
        ),
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
        // height: double.infinity,
        // width: double.infinity,
        // margin: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20), color: color),
        alignment: Alignment.center,
        child: Text(
          "${this.widget.text}",
          style: TextStyle(fontSize: 20, fontFamily: "SukhumvitSet-Bold"),
        ),
      ),
    );
  }
}
