import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fooder/function/ClassObjects/httpObjectChatRoomUsers.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class Chat_AppBarComponent extends StatefulWidget {
  String chatmanager_id;
  Chat_AppBarComponent({@required this.chatmanager_id});
  @override
  _Chat_AppBarComponentState createState() => _Chat_AppBarComponentState();
}

class _Chat_AppBarComponentState extends State<Chat_AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget BackButton = GestureDetector(
      onTap: () {
        Back();
      },
      child: Container(
        height: 65,
        width: 65,
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios,
          size: 40,
          color: Colors.white,
        ),
      ),
    );

    String chatmanager_id = this.widget.chatmanager_id;
    return Consumer(
        builder: (context, DataManagementProvider provider, Widget child) {
      String shop_id = provider.bufferChatmanager[chatmanager_id].shop_id;
      String name = provider.bufferShopInfoMini[shop_id].name;
      String image = provider.bufferShopInfoMini[shop_id].image;

      Widget ShopImage = Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "${HostName()}/image/ImageProfileShop/${image}"))),
      );
      Widget ShowName = Container(
        margin: EdgeInsets.only(left: 15),
        child: Text(
          "${name}",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
      );
      return Container(
        height: 65,
        width: double.infinity,
        child: Row(
          children: [BackButton, ShopImage, ShowName],
        ),
      );
    });
  }

  Future<void> Back() async {
    Navigator.of(context).pop();
  }
}

//ส่วนของการประมวลผล

// //ส่วนของการแสดงผล


