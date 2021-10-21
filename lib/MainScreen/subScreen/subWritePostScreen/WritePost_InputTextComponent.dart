import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritePost_InputTextComponent extends StatefulWidget {
  String message;

  Function fun;
  WritePost_InputTextComponent({@required this.message, @required this.fun});
  @override
  _WritePost_InputTextComponentState createState() =>
      _WritePost_InputTextComponentState();
}

class _WritePost_InputTextComponentState
    extends State<WritePost_InputTextComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      width: weight_screen,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: TextEditingController(text: this.widget.message),
        minLines: 5,
        maxLines: 100,
        onChanged: (e) {
          print(e);
          this.widget.fun(e);
        },
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
