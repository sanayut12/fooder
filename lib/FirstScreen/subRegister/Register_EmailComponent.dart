import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register_EmailComponent extends StatefulWidget {
  String email;
  final Function fun;
  Register_EmailComponent({@required this.email, @required this.fun});
  @override
  _Register_EmailComponentState createState() =>
      _Register_EmailComponentState();
}

class _Register_EmailComponentState extends State<Register_EmailComponent> {
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: this.widget.email);
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        style:
            TextStyle(fontSize: weight_screen * 0.04, color: Color(0xFFC9BABA)),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                // borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 5.0,
                    style: BorderStyle.none,
                    color: Color(0xFFC9BABA))),
            hintText: "ใส่อีเมล"),
        onChanged: (e) {
          this.widget.fun(e);
        },
      ),
    );
  }
}
