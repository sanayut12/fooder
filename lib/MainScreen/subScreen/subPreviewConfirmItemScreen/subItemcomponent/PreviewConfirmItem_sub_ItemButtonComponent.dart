import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviewConfirmItem_sub_ItemButtonComponent extends StatefulWidget {
  IconData icon;
  Function fun;
  int status; //1 or -1
  PreviewConfirmItem_sub_ItemButtonComponent(
      {@required this.icon, @required this.fun, @required this.status});
  @override
  _PreviewConfirmItem_sub_ItemButtonComponentState createState() =>
      _PreviewConfirmItem_sub_ItemButtonComponentState();
}

class _PreviewConfirmItem_sub_ItemButtonComponentState
    extends State<PreviewConfirmItem_sub_ItemButtonComponent> {
  Color color = Color(0xfffa897b);
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.white;
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Color(0xfffa897b);
        });
        await Future.delayed(Duration(milliseconds: 50));
        this.widget.fun(this.widget.status);
      },
      child: Container(
        padding: EdgeInsets.all(weight_screen * 0.006),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(weight_screen * 0.008)),
        child: Icon(
          this.widget.icon,
          size: weight_screen * 0.06,
          color: Colors.grey[850],
        ),
      ),
    );
  }
}
