import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_ShopInfoTap extends StatefulWidget {
  final DataShopInfo_PostBox dataShopInfo_PostBox;
  PostBox_ShopInfoTap({@required this.dataShopInfo_PostBox});
  @override
  _PostBox_ShopInfoTapState createState() => _PostBox_ShopInfoTapState();
}

class _PostBox_ShopInfoTapState extends State<PostBox_ShopInfoTap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget ImageShop = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.dataShopInfo_PostBox.image}"))),
    );
    TextStyle styleName = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    Widget NameShop = Container(
      height: 40,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      child: Text(
        "${this.widget.dataShopInfo_PostBox.name}",
        style: styleName,
      ),
    );

    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.amber,
      child: Row(
        children: [ImageShop, Expanded(child: NameShop)],
      ),
    );
  }
}
