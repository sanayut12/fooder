import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertCardAsk extends StatefulWidget {
  String message;
  Function func;
  AlertCardAsk({@required this.message, @required this.func});
  @override
  _AlertCardAskState createState() => _AlertCardAskState();
}

class _AlertCardAskState extends State<AlertCardAsk> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("ไม่")),
        TextButton(
            onPressed: () {
              this.widget.func();
            },
            child: Text("ใช่")),
      ],
      content: Text("${this.widget.message}"),
    );
  }
}
