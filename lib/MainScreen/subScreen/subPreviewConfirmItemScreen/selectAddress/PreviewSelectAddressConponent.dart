import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviewSelectAddressConponent extends StatefulWidget {
  String text;
  Function fun;
  PreviewSelectAddressConponent({@required this.text, @required this.fun});
  @override
  _PreviewSelectAddressConponentState createState() =>
      _PreviewSelectAddressConponentState();
}

class _PreviewSelectAddressConponentState
    extends State<PreviewSelectAddressConponent> {
  Color color = Color(0xfffa897b);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.white;
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Color(0xfffa897b);
        });
        await Future.delayed(Duration(milliseconds: 10));
        this.widget.fun();
      },
      child: Container(
        // height: 100,

        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),

        child: Text("${this.widget.text}"),
      ),
    );
  }
}
