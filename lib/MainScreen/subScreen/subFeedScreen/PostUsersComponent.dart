import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostUsers/PostUsers_DetailComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostUsers/PostUsers_MiniProfileComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostUsers/PostUsers_ShowImageComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostUsers_Data.dart';

class PostUsersComponent extends StatefulWidget {
  GetPostUsers_PostInfo data;
  PostUsersComponent({@required this.data});
  @override
  _PostUsersComponentState createState() => _PostUsersComponentState();
}

class _PostUsersComponentState extends State<PostUsersComponent> {
  @override
  Widget build(BuildContext context) {
    GetPostUsers_PostInfo data = this.widget.data;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          PostUsers_MiniProfileComponent(data: data),
          PostUsers_DetailComponent(data: data),
          PostUsers_ShowImageComponent(data: data)
        ],
      ),
    );
  }
}
