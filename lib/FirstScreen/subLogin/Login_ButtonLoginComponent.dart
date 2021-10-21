import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_ButtonLoginComponent extends StatefulWidget {
  final Function fun;
  Login_ButtonLoginComponent({@required this.fun});
  @override
  _Login_ButtonLoginComponentState createState() =>
      _Login_ButtonLoginComponentState();
}

class _Login_ButtonLoginComponentState
    extends State<Login_ButtonLoginComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // OnpressLogin();
        // print("${this.widget.phone} \n${this.widget.password}");
        this.widget.fun();
      },
      child: Container(
        alignment: Alignment.center,
        height: weight_screen * 0.1,
        width: weight_screen * 0.35,
        child: Text(
          "เข้าสู่ระบบ",
          style: TextStyle(fontSize: weight_screen * 0.05, color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Color(0xFFFA897B),
            borderRadius:
                BorderRadius.all(Radius.circular(weight_screen * 0.5))),
      ),
    );
  }
}
