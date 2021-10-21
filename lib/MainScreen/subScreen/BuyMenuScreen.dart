import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/ChatScreen.dart';
import 'package:fooder/MainScreen/subScreen/PreviewConfirmItemScreen.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_AppbarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_DetailComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_ListImage.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_NameComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_OptionUser.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_Optionbuy2Component.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_Status1Component.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_OptionBarComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectAddItemtoBasket.dart';
import 'package:fooder/function/ClassObjects/httpObjectBuyNowItem.dart';
import 'package:fooder/function/ClassObjects/httpObjectChatConnection.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemBuyNow.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';

import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpAddItemToBasket.dart';
import 'package:fooder/function/http/httpBuyNowItem.dart';
import 'package:fooder/function/http/httpChatConnection.dart';
import 'package:fooder/function/http/httpGetItemBuyNow.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class BuyMenuScreen extends StatefulWidget {
  String inventory_id;
  GetPostFeedFooderPostShopResponse data;
  BuyMenuScreen({@required this.inventory_id, @required this.data});
  @override
  _BuyMenuScreenState createState() => _BuyMenuScreenState();
}

class _BuyMenuScreenState extends State<BuyMenuScreen> {
  int quantity = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("${this.widget.dataMenu.inventory_id}");
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    String menu_id = this
        .widget
        .data
        .bufferDataInventory_PostBox[this.widget.inventory_id]
        .menu_id;
    String name = this.widget.data.bufferDataMenu_PostBox[menu_id].name;
    String image = this.widget.data.bufferDataMenu_PostBox[menu_id].path;
    int cost = this
        .widget
        .data
        .bufferDataInventory_PostBox[this.widget.inventory_id]
        .cost;
    Widget ForeGround = Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: [
          Stack(
            children: [
              BuyMenu_ListImageComponent(
                inventory_id: this.widget.inventory_id,
                data: this.widget.data,
              ),
              Container(
                margin: EdgeInsets.only(top: weight_screen * 0.9),
                padding: EdgeInsets.all(weight_screen * 0.04),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(weight_screen * 0.1),
                        topLeft: Radius.circular(weight_screen * 0.1))),
                child: Column(
                  children: [
                    // BuyMenu_NameMenuComponent(),
                    BuyMenu_NameComponent(name: name),
                    BuyMenu_DetailComponent(
                      dataMenu:
                          this.widget.data.bufferDataMenu_PostBox[menu_id],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuyMenu_Optionbuy2Component(
                          quantity: quantity,
                          fun: SetQuantity,
                        ),
                        Text(
                          "${cost} บาท",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    BuyMenu_Status1Component(
                        inventory_id: this.widget.inventory_id,
                        dataInventory:
                            this.widget.data.bufferDataInventory_PostBox[
                                this.widget.inventory_id]),
                    // IconButton(
                    //     onPressed: () {
                    //       OpenChatScreen();
                    //     },
                    //     icon: Icon(Icons.chat)),
                    SizedBox(
                      height: 150,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xfffa897b), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            ForeGround,
            Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuyMenu_AppbarComponent(
                    name: name,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: BuyMenu_OptionUser(
                      CallBuyNow: CallBuyNow,
                      CallAddBaseket: CallAddBaseket,
                      CallChat: OpenChatScreen,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> OpenChatScreen() async {
    String user_id = UserInfoManagement().User_id();
    String shop_id = this.widget.data.dataPost_PostBox.shop_id;
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
              type_chat: "4",
              message: this.widget.inventory_id,
            )));
  }

  Future<void> SetQuantity(int status) {
    int _quantity = quantity + (status * 1);

    if (_quantity > 0) {
      setState(() {
        quantity = _quantity;
      });
    }
  }

  Future<void> CallAddBaseket() async {
    print("1");
    httpAddMenuTobasket();
  }

  Future<void> CallBuyNow() async {
    BuyNow();
    print("2");
  }

  Future httpAddMenuTobasket() async {
    String user_id = await UserInfoManagement().User_id();
    String inventory_id = this.widget.inventory_id;
    AddItemTobasketRequest bufferAddItemTobasketRequest =
        AddItemTobasketRequest(
            user_id: user_id, inventory_id: inventory_id, quantity: quantity);
    AddItemToBasketResponse bufferAddItemToBasketResponse =
        await HttpAddMenuToBasket(
            bufferAddMenuTobasketRequest: bufferAddItemTobasketRequest);
    print(bufferAddItemToBasketResponse.code);
    if (bufferAddItemToBasketResponse.code == "20200") {
      AlertMenu();
    }
  }

  Future<void> BuyNow() async {
    String user_id = await UserInfoManagement().User_id();
    String post_id = this.widget.data.dataPost_PostBox.post_id;
    BuyNowItemRequest bufferBuyNowItemRequest = BuyNowItemRequest(
        user_id: user_id,
        post_id: post_id,
        inventory_id: this.widget.inventory_id,
        quantity: quantity);
    BuyNowItemResponse bufferBuyNowItemResponse =
        await HttpBuyNowItem(bufferBuyNowItemRequest: bufferBuyNowItemRequest);
    if (bufferBuyNowItemResponse.code == "20200") {
      GetItemBuyNowRequest bufferGetItemBuyNowRequest =
          GetItemBuyNowRequest(user_id: user_id, post_id: post_id);
      GetItemInBasket_ItemsResponse bufferGetItemInBasket_ItemsResponse =
          await HttpGetItemBuyNow(
              bufferGetItemBuyNowRequest: bufferGetItemBuyNowRequest);
      PreviewConfirmItem_return bufferPreviewConfirmItem_return =
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PreviewConfirmItemScreen(
                  mode: "2", data: bufferGetItemInBasket_ItemsResponse)));
      if (bufferPreviewConfirmItem_return == null) {
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  Future AlertMenu() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          String menu_id = this
              .widget
              .data
              .bufferDataInventory_PostBox[this.widget.inventory_id]
              .menu_id;
          String name = this.widget.data.bufferDataMenu_PostBox[menu_id].name;
          return AlertDialog(
            content: Text("คุณได้เพิ่มเมนู ${name} ลงตะกร้าสำเร็จ"),
            actions: [
              GestureDetector(
                onTap: () async {
                  await Navigator.of(context).pop();
                  await Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xfffa897b),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("ตกลง"),
                ),
              )
            ],
          );
        });
  }
}
