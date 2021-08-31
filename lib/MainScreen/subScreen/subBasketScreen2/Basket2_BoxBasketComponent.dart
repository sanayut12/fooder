import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_BoxBasketOptionComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_BoxBasketShopInfoComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_BoxBasketTimeStopComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_BoxBasketTotalCostComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_boxBasketItemComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetItemInBasket_Items.dart';

class Basket2_BoxBasketComponent extends StatefulWidget {
  final String post_id;
  Basket2_BoxBasketComponent({@required this.post_id});
  @override
  _Basket2_BoxBasketComponentState createState() =>
      _Basket2_BoxBasketComponentState();
}

class _Basket2_BoxBasketComponentState
    extends State<Basket2_BoxBasketComponent> {
  GetItemInBasket_ItemsResponse data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetDataBasket();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container();
    } else {
      List<Widget> ListItemsComponent = [];
      data.bufferItem.forEach((element) {
        BasketBox_Item item = element;
        String inventory_id = item.inventory_id;
        BasketBox_Inventory inventory = data.bufferInventory[inventory_id];
        String menu_id = inventory.menu_id;
        BasketBox_Menu menu = data.bufferMenu[menu_id];
        ListItemsComponent.add(Basket2_boxBasketItemComponent(
            item: item, inventory: inventory, menu: menu));
      });
      Widget ShowAllMenu = Container(
          height: 100 * data.bufferItem.length.toDouble(),
          width: double.infinity,
          child: Column(
            children: ListItemsComponent,
          ));

      return Container(
        width: double.infinity,
        // height: 100,
        margin: EdgeInsets.only(bottom: 1),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Basket2_BoxBasketShopInfoComponent(shop_info: data.shop_info),
            ShowAllMenu,
            Basket2_BoxBasketTimeStopComponent(post_info: data.post_info),
            Basket2_BoxBasketTotalCostComponent(data: data),
            Basket2_BoxBasketOptionComponent(data: data)
          ],
        ),
        // color: data == null ? Colors.red : Colors.blue,
        // child: Text("${this.widget.post_id}"),
      );
    }
  }

  Future<void> GetDataBasket() async {
    String user_id = UserInfoManagement().User_id();
    GetItemInBasket_ItemsRequest bufferGetItemInBasket_ItemsRequest =
        GetItemInBasket_ItemsRequest(
            user_id: user_id, post_id: this.widget.post_id);
    GetItemInBasket_ItemsResponse bufferGetItemInBasket_ItemsResponse =
        await HttpGetItemInBasketItems(
            bufferGetItemInBasket_ItemsRequest:
                bufferGetItemInBasket_ItemsRequest);
    setState(() {
      data = bufferGetItemInBasket_ItemsResponse;
    });
  }
}
