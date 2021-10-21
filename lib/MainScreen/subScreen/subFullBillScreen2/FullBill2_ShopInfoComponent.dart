import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/ChatScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectChatConnection.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpChatConnection.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class FullBill2_ShopInfoComponent extends StatefulWidget {
  GetBillFooderDataResponse data;
  FullBill2_ShopInfoComponent({@required this.data});
  @override
  _FullBill2_ShopInfoComponentState createState() =>
      _FullBill2_ShopInfoComponentState();
}

class _FullBill2_ShopInfoComponentState
    extends State<FullBill2_ShopInfoComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShopProfile = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.data.shop_info.image}"))),
    );
    Widget ShopName = Container(
      child: Text("${this.widget.data.shop_info.name}"),
    );
    Widget ChatButton = IconButton(
        onPressed: () {
          OpenChatScreen();
        },
        icon: Icon(Icons.chat));
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ShopProfile,
                  ShopName,
                ],
              ),
              ChatButton
            ],
          ),
        ],
      ),
    );
  }

  Future<void> OpenChatScreen() async {
    String user_id = UserInfoManagement().User_id();
    String shop_id = this.widget.data.post_info.shop_id;
    ChatConnectRequest bufferChatConnectRequest =
        ChatConnectRequest(user_id: user_id, shop_id: shop_id);
    ChatConnectionResponse bufferChatConnectionResponse =
        await HttpChatConnection(
            bufferChatConnectRequest: bufferChatConnectRequest);
    ///////////////////////////////
    String chatmanager_id = bufferChatConnectionResponse.chatmanager_id;
    ShopProfileMini shopProfileMini =
        bufferChatConnectionResponse.shopProfileMini;
    ChatManager chatManager = bufferChatConnectionResponse.chatManager;
    /////เพิ่มข้อมูลลงไปในส่วน provider
    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    provider.AddShopProfileMini(shop_id, shopProfileMini);
    provider.AddChatmanager(chatmanager_id, chatManager);
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ChatScreen(
              chatmanager_id: chatmanager_id,
              type_chat: "6",
              message: this.widget.data.bill.bill_id,
            )));
  }
}
