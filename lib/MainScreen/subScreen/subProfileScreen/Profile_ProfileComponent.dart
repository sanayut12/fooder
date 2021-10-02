import 'package:flutter/cupertino.dart';
import 'package:fooder/MainScreen/subScreen/subProfileScreen/ProfileProfile/ProfileProfile_BackGroundComponent.dart';
import 'package:fooder/MainScreen/subScreen/subProfileScreen/ProfileProfile/ProfileProfile_DetailComponent.dart';
import 'package:fooder/MainScreen/subScreen/subProfileScreen/ProfileProfile/ProfileProfile_ImageComponent.dart';

class Profile_ProfileComponent extends StatefulWidget {
  @override
  _Profile_ProfileComponentState createState() =>
      _Profile_ProfileComponentState();
}

class _Profile_ProfileComponentState extends State<Profile_ProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          //หลังสุด
          Column(
            children: [
              ProfileProfile_BackGroundComponent(),
              ProfileProfile_DetailComponent(),
            ],
          ),
          //กลาง
          ProfileProfile_ImageComponent(),
          //หน้าสุด
        ],
      ),
    );
  }
}
