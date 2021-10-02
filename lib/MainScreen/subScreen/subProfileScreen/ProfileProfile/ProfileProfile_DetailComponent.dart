import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileProfile_DetailComponent extends StatefulWidget {
  @override
  _ProfileProfile_DetailComponentState createState() =>
      _ProfileProfile_DetailComponentState();
}

class _ProfileProfile_DetailComponentState
    extends State<ProfileProfile_DetailComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.3,
      width: double.infinity,
      color: Colors.red,
    );
  }
}
