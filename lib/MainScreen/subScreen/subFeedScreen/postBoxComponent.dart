import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_Detail.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_ListMenu.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_ShopInfoTap.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subPostBoxComponent/PostBox_status2.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class PostBoxComponent extends StatefulWidget {
  // String post_id;
  GetPostFeedFooderPostShopResponse data;
  final Function PopUpAddItemToBasket;
  PostBoxComponent({@required this.data, @required this.PopUpAddItemToBasket});
  @override
  _PostBoxComponentState createState() => _PostBoxComponentState();
}

class _PostBoxComponentState extends State<PostBoxComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10, right: 10),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey[500],
            offset: Offset(0.1, 0.1),
            blurRadius: 0.1,
            spreadRadius: 0.5)
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Consumer(
          builder: (context, DataManagementProvider provider, Widget child) {
        String language = provider.LanguageValue();
        return Column(
          children: [
            // Text(
            //     "oo${data.dataPost_PostBox.over_order} co${data.dataPost_PostBox.confirm_order}"),
            PostBox_ShopInfoTap(
                language: language,
                dataShopInfo_PostBox: this.widget.data.dataShopInfo_PostBox,
                dataPost_PostBox: this.widget.data.dataPost_PostBox),
            // PostBox_StatusBar1(),
            PostBox_Detail(dataPost_PostBox: this.widget.data.dataPost_PostBox),
            PostBox_ListMenu(
              data: this.widget.data,
              PopUpAddItemToBasket: this.widget.PopUpAddItemToBasket,
            ),
            PostBox_StatusBar2(
                language: language,
                dataPost_PostBox: this.widget.data.dataPost_PostBox),
          ],
        );
      }),
    );
  }
}
