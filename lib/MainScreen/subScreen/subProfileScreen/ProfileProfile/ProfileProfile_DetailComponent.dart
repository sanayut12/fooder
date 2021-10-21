import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';

class ProfileProfile_DetailComponent extends StatefulWidget {
  @override
  _ProfileProfile_DetailComponentState createState() =>
      _ProfileProfile_DetailComponentState();
}

class _ProfileProfile_DetailComponentState
    extends State<ProfileProfile_DetailComponent> {
  @override
  Widget build(BuildContext context) {
    String name = UserInfoManagement().Name();
    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      width: double.infinity,
      padding: EdgeInsets.only(right: 30),
      alignment: Alignment.topRight,

      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
        child: Text(
          "${name}",
          style: TextStyle(fontSize: 25, fontFamily: "SukhumvitSet-Bold"),
        ),
      ),
      // color: Colors.red,
    );
  }
}
