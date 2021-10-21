import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainFirst_SelectBarComponent extends StatefulWidget {
  bool active;
  final Function fun;
  MainFirst_SelectBarComponent({@required this.fun, @required this.active});
  @override
  _MainFirst_SelectBarComponentState createState() =>
      _MainFirst_SelectBarComponentState();
}

class _MainFirst_SelectBarComponentState
    extends State<MainFirst_SelectBarComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      height: weight_screen * 0.2,
      width: weight_screen * 0.6,
      child: Stack(children: [
        Container(
          height: weight_screen * 0.2,
          width: weight_screen * 0.6,
          alignment: Alignment.centerRight,
          child: ButtonModel2(
              text: "ลงทะเบียน",
              fun: this.widget.fun,
              active: !this.widget.active),
        ),
        Container(
          height: weight_screen * 0.2,
          width: weight_screen * 0.6,
          alignment: Alignment.centerLeft,
          child: ButtonModel(
              text: "เข้าสู่ระบบ",
              fun: this.widget.fun,
              active: this.widget.active),
        )
      ]),
    );
  }
}

class ButtonModel extends StatefulWidget {
  bool active;
  String text;
  final Function fun;
  ButtonModel({@required this.text, @required this.fun, @required this.active});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        this.widget.fun(true);
      },
      child: Container(
        height: weight_screen * 0.1,
        width: weight_screen * 0.32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(weight_screen * 0.1),
          border: Border.all(color: Colors.grey[200]),
          color: this.widget.active ? Color(0xFFFA897B) : Colors.white,
        ),
        child: Text(
          "${this.widget.text}",
          style: TextStyle(
            fontSize: weight_screen * 0.040,
            fontWeight: FontWeight.w600,
            color: !this.widget.active ? Color(0xFFFA897B) : Colors.white,
          ),
        ),
      ),
    );
  }
}

class ButtonModel2 extends StatefulWidget {
  bool active;
  String text;
  final Function fun;
  ButtonModel2(
      {@required this.text, @required this.fun, @required this.active});
  @override
  _ButtonModel2State createState() => _ButtonModel2State();
}

class _ButtonModel2State extends State<ButtonModel2> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        this.widget.fun(false);
      },
      child: Container(
        height: weight_screen * 0.1,
        width: weight_screen * 0.37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(weight_screen * 0.1),
          border: Border.all(color: Colors.grey[200]),
          color: this.widget.active ? Color(0xFFFA897B) : Colors.white,
        ),
        alignment: Alignment.centerRight,
        child: Container(
          height: weight_screen * 0.1,
          width: weight_screen * 0.32,
          alignment: Alignment.center,
          child: Text(
            "${this.widget.text}",
            style: TextStyle(
              fontSize: weight_screen * 0.040,
              fontWeight: FontWeight.w600,
              color: !this.widget.active ? Color(0xFFFA897B) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
// Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           child: Container(
//             width: 100,
//             height: 40,
//             child: Text(
//               "${lgm.value('001', _language)}",
//               style: TextStyle(
//                 color: this.page == 1 ? Colors.red : Colors.white,
//               ),
//             ),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: this.page == 0 ? Colors.red : Colors.white,
//             ),
//           ),
//           onTap: () {
//             setState(() {
//               this.page = 0;
//             });
//           },
//         ),
//         GestureDetector(
//           child: Container(
//             width: 100,
//             height: 40,
//             child: Text(
//               "${lgm.value('002', _language)}",
//               style: TextStyle(
//                 color: this.page == 0 ? Colors.red : Colors.white,
//               ),
//             ),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: this.page == 1 ? Colors.red : Colors.white,
//             ),
//           ),
//           onTap: () {
//             setState(() {
//               this.page = 1;
//             });
//           },
//         ),
//       ],
//     )