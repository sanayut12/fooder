import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_Detail.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_ListMenu.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_ShopInfoTap.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_status1.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_status2.dart';

import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
// import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/http/httpGetPostFeedFooderPost_shop.dart';

class PostBoxComponent extends StatefulWidget {
  String post_id;

  PostBoxComponent({@required this.post_id});
  @override
  _PostBoxComponentState createState() => _PostBoxComponentState();
}

class _PostBoxComponentState extends State<PostBoxComponent> {
  GetPostFeedFooderPostShopResponse data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("${this.widget.post_id}");
    getFeedPost();
  }
  // String

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(top: 5),
        width: double.infinity,
        // height: 400,
        // color: Colors.red,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Column(
          children: [
            // Text(
            //     "oo${data.dataPost_PostBox.over_order} co${data.dataPost_PostBox.confirm_order}"),
            PostBox_ShopInfoTap(
                dataShopInfo_PostBox: data.dataShopInfo_PostBox),
            PostBox_StatusBar1(dataPost_PostBox: data.dataPost_PostBox),
            PostBox_Detail(dataPost_PostBox: data.dataPost_PostBox),
            PostBox_ListMenu(
                bufferDataInventory_PostBox: data.bufferDataInventory_PostBox,
                bufferDataMenu_PostBox: data.bufferDataMenu_PostBox),
            PostBox_StatusBar2(dataPost_PostBox: data.dataPost_PostBox),
          ],
        ),
      );
    }
  }

  Future<void> getFeedPost() async {
    GetPostFeedFooderPostShopRequest bufferGetPostFeedFooderPostShopRequest =
        GetPostFeedFooderPostShopRequest(post_id: this.widget.post_id);
    GetPostFeedFooderPostShopResponse bufferGetPostFeedFooderPostShopResponse =
        await HttpGetPostFeedFooderPostShop(
            bufferGetPostFeedFooderPostShopRequest);

    setState(() {
      data = bufferGetPostFeedFooderPostShopResponse;
    });
  }
}
