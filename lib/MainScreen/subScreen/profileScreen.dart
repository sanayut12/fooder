import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name;
  String image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile();
  }

  Future getUserProfile() async {
    String _name = await UserInfoManagement().Name();
    String _image = await UserInfoManagement().Image();
    setState(() {
      name = _name;
      image = _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "$name",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Text(
            "$image",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Text("${HostName()}")
        ],
      ),
    );
  }
}
