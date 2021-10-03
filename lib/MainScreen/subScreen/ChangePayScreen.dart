import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePayScreen extends StatefulWidget {
  @override
  _ChangePayScreenState createState() => _ChangePayScreenState();
}

class _ChangePayScreenState extends State<ChangePayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfffa897b),
        child: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        )),
      ),
    );
  }
}
