import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBox_ButtonComponent extends StatefulWidget {
  String text;
  Function fun;
  MenuBox_ButtonComponent({@required this.text, @required this.fun});
  @override
  _MenuBox_ButtonComponentState createState() =>
      _MenuBox_ButtonComponentState();
}

class _MenuBox_ButtonComponentState extends State<MenuBox_ButtonComponent> {
  Color color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.grey[500];
        });

        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Colors.amber;
        });
        await Future.delayed(Duration(milliseconds: 50));
        this.widget.fun();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "${this.widget.text}",
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
        ),
      ),
    );
  }
}
