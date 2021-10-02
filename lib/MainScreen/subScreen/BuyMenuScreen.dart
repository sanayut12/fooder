import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/PreviewConfirmItemScreen.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_AppbarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_DetailComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_ListImage.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_OptionUser.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_Optionbuy2Component.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_Status1Component.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_OptionBarComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectAddItemtoBasket.dart';
import 'package:fooder/function/ClassObjects/httpObjectBuyNowItem.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemBuyNow.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';

import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpAddItemToBasket.dart';
import 'package:fooder/function/http/httpBuyNowItem.dart';
import 'package:fooder/function/http/httpGetItemBuyNow.dart';

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
    // int quantity = this
    //     .widget
    //     .data
    //     .bufferDataInventory_PostBox[this.widget.inventory_id]
    //     .quantity;
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
        child: Column(
          children: [
            BuyMenu_AppbarComponent(
              name: name,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      // color: Colors.green,
                      child: ListView(
                        children: [
                          BuyMenu_ListImageComponent(
                            inventory_id: this.widget.inventory_id,
                            data: this.widget.data,
                          ),
                          // BuyMenu_NameMenuComponent(),
                          BuyMenu_Optionbuy2Component(
                            quantity: quantity,
                            fun: SetQuantity,
                          ),
                          BuyMenu_Status1Component(
                              inventory_id: this.widget.inventory_id,
                              dataInventory:
                                  this.widget.data.bufferDataInventory_PostBox[
                                      this.widget.inventory_id]),
                          BuyMenu_DetailComponent(
                            dataMenu: this
                                .widget
                                .data
                                .bufferDataMenu_PostBox[menu_id],
                          ),
                          SizedBox(
                            height: 150,
                          )
                          // BuyMenu_OptionBuy(
                          //   active: active,
                          //   setActive: setActive,
                          // ),
                          // BuyMenu_OptionBar(
                          //   dataInventory: this.widget.dataInventory,
                          //   dataMenu: this.widget.dataMenu,
                          // )
                        ],
                      )),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    child: BuyMenu_OptionUser(
                        CallBuyNow: CallBuyNow, CallAddBaseket: CallAddBaseket),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
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
            content: Text("คุณได้เพิ่มเมนู ${name} ลงตะกล้าสำเร็จ"),
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
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("ตกลง"),
                ),
              )
            ],
          );
        });
  }
}
