import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/PostUsersComponent.dart';
import 'package:fooder/MainScreen/subScreen/subProfileScreen/Profile_ProfileComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostUsers_Data.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostUsers_Init.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetPostUsers_Data.dart';
import 'package:fooder/function/http/httpGetPostUsers_Init.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, GetPostUsers_PostInfo> data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPost();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xfffa897b), Colors.white])),
        child: ListView.builder(
            itemCount: data.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  children: [
                    Profile_ProfileComponent(),
                  ],
                );
              } else {
                String post_users_id = data.keys.toList()[index - 1];
                return PostUsersComponent(data: data[post_users_id]);
              }
            }));
  }

  Future<void> GetPost() async {
    String user_id = UserInfoManagement().User_id();
    GetPostUsersInitRequest bufferGetPostUsersInitRequest =
        GetPostUsersInitRequest(user_id: user_id);
    GetPostUsersInitResponse bufferGetPostUsersInitResponse =
        await HttpGetPostUsersInit(
            bufferGetPostUsersInitRequest: bufferGetPostUsersInitRequest);
    for (int i = 0;
        i < bufferGetPostUsersInitResponse.bufferPostUser_id.length;
        i++) {
      String post_users_id =
          bufferGetPostUsersInitResponse.bufferPostUser_id[i];
      GetPostUsersDataRequest bufferGetPostUsersDataRequest =
          GetPostUsersDataRequest(post_users_id: post_users_id);
      GetPostUsersDataResponse _data = await HttpGetPostUsersData(
          bufferGetPostUsersDataRequest: bufferGetPostUsersDataRequest);
      setState(() {
        data[post_users_id] = _data.post_info;
      });
    }
  }
}
