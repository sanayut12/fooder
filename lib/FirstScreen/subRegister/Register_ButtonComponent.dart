import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class Register_ButtonComponent extends StatefulWidget {
  final Function fun;
  Register_ButtonComponent({@required this.fun});

  @override
  _Register_ButtonComponentState createState() =>
      _Register_ButtonComponentState();
}

class _Register_ButtonComponentState extends State<Register_ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        this.widget.fun();
      },
      child: Container(
        height: weight_screen * 0.1,
        width: weight_screen * 0.35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFFFA897B),
            borderRadius: BorderRadius.circular(weight_screen * 0.05)),
        child: Text(
          "ลงทะเบียน",
          style: TextStyle(
              fontSize: weight_screen * 0.04, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
