import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register_NameComponent extends StatefulWidget {
  String name;
  final Function fun;
  Register_NameComponent({@required this.name, @required this.fun});
  @override
  _Register_NameComponentState createState() => _Register_NameComponentState();
}

class _Register_NameComponentState extends State<Register_NameComponent> {
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: this.widget.name);
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
            hintText: "ใส่ชื่อ"),
        onChanged: (e) {
          this.widget.fun(e);
        },
      ),
    );
  }
}
