import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileProfile_BackGroundComponent extends StatefulWidget {
  @override
  _ProfileProfile_BackGroundComponentState createState() =>
      _ProfileProfile_BackGroundComponentState();
}

class _ProfileProfile_BackGroundComponentState
    extends State<ProfileProfile_BackGroundComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.4,
      width: double.infinity,
      color: Colors.grey[200],
    );
  }
}
