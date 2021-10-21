import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register_PhoneComponent extends StatefulWidget {
  String phone;
  final Function fun;
  Register_PhoneComponent({@required this.phone, @required this.fun});
  @override
  _Register_PhoneComponentState createState() =>
      _Register_PhoneComponentState();
}

class _Register_PhoneComponentState extends State<Register_PhoneComponent> {
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: this.widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
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
            hintText: "ใส่เบอร์โทรศัพท์"),
        validator: (e) {
          if (e.length == 10) {
            return null;
          } else {
            return "กรุณาใส่เบอร์โทรศัพท์ที่ถูกต้อง";
          }
        },
        onChanged: (e) {
          this.widget.fun(e);
        },
      ),
    );
  }
}
