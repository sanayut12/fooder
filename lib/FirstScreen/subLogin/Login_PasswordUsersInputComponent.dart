import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_PasswordUsersInputComponent extends StatefulWidget {
  String password;
  final Function fun;
  Login_PasswordUsersInputComponent(
      {@required this.password, @required this.fun});
  @override
  _Login_PasswordUsersInputComponentState createState() =>
      _Login_PasswordUsersInputComponentState();
}

class _Login_PasswordUsersInputComponentState
    extends State<Login_PasswordUsersInputComponent> {
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: this.widget.password);
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      child: TextFormField(
        controller: controller,
        style:
            TextStyle(fontSize: weight_screen * 0.04, color: Color(0xFFC9BABA)),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                // borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 5.0,
                    style: BorderStyle.none,
                    color: Color(0xFFC9BABA))),
            hintText: "ใส่รหัสผ่าน"),
        obscureText: true,
        onChanged: (e) {
          this.widget.fun(e);
        },
      ),
    );
  }
}
