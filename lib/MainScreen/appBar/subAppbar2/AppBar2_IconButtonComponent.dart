import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppBar2_IconButtonComponent extends StatefulWidget {
  IconData icon;
  Function fun;
  int number;
  AppBar2_IconButtonComponent(
      {@required this.icon, @required this.fun, @required this.number});
  @override
  _AppBar2_IconButtonComponentState createState() =>
      _AppBar2_IconButtonComponentState();
}

class _AppBar2_IconButtonComponentState
    extends State<AppBar2_IconButtonComponent> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    // Widget ButtonModel() => ;
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      height: weight_screen * 0.15,
      width: weight_screen * 0.15,
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          GestureDetector(
            onTap: () async {
              setState(() {
                color = Colors.grey[200];
              });

              await Future.delayed(Duration(milliseconds: 50));
              setState(() {
                color = Colors.transparent;
              });
              await Future.delayed(Duration(milliseconds: 50));
              this.widget.fun();
            },
            child: Container(
                // padding: EdgeInsets.all(weight_screen * 0.02),
                height: weight_screen * 0.1,
                width: weight_screen * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: Icon(
                  this.widget.icon,
                  size: weight_screen * 0.08,
                )),
          ),
          // Expanded(child: Container())
          Container(
            height: weight_screen * 0.15,
            width: weight_screen * 0.15,
            alignment: Alignment(0.9, -0.9),
            child: this.widget.number == 0
                ? Container()
                : Container(
                    height: weight_screen * 0.05,
                    width: weight_screen * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.all(color: Colors.grey[200])),
                    child: Text(
                      "${this.widget.number > 99 ? '99+' : this.widget.number}",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ),
            // color: Colors.red,
          )
        ],
      ),
    );
  }
}
