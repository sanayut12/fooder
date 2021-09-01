import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_boxBasketItemComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_ItemComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_OptionBarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_SelectAddressComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_SelectHowPayComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_SelectHowSendComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_ShopInfoComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_TimeStopComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_TotalCostContainer.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class PreviewConfirmItemScreen extends StatefulWidget {
  final GetItemInBasket_ItemsResponse data;
  PreviewConfirmItemScreen({@required this.data});
  @override
  _PreviewConfirmItemScreenState createState() =>
      _PreviewConfirmItemScreenState();
}

class _PreviewConfirmItemScreenState extends State<PreviewConfirmItemScreen> {
  String how_send;
  String address_select;
  String how_pay;

  int active = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> ListItemsComponent = [];
    this.widget.data.bufferItem.forEach((element) {
      BasketBox_Item item = element;
      String inventory_id = item.inventory_id;
      BasketBox_Inventory inventory =
          this.widget.data.bufferInventory[inventory_id];
      String menu_id = inventory.menu_id;
      BasketBox_Menu menu = this.widget.data.bufferMenu[menu_id];

      ListItemsComponent.add(PreviewConfirmItem_ItemComponent(
          item: item, inventory: inventory, menu: menu));
    });
    Widget ShowAllMenu = Container(
        height: 100 * this.widget.data.bufferItem.length.toDouble(),
        width: double.infinity,
        child: Column(
          children: ListItemsComponent,
        ));

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow,
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView(
                  children: [
                    Text(
                      "ยืนยันการชำระสินค้า",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          PreviewConfirmItem_ShopInfoComponent(
                              shop_info: this.widget.data.shop_info),
                          ShowAllMenu,
                          PreviewConfirmItem_TimeStopComponent(
                              post_info: this.widget.data.post_info),
                          Text("อัตราค่าบริการ"),
                          PreviewConfirmItem_TotalCostContainer(
                              data: this.widget.data),
                        ],
                      ),
                    ),
                    PreviewConfirmItem_SelectHowSendComponent(
                      how_send: how_send,
                      data: this.widget.data,
                      SetHowSend: SetHowSend,
                    ),
                    PreviewConfirmItem_SelectAddressComponent(
                      SetAddressSelect: SetAddressSelect,
                    ),
                    // Text("${address_select}")
                    PreviewConfirmItem_SelectHowPayComponent(
                        how_pay: how_pay, SetHowPay: SetHowPay),
                    SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
              PreviewConfirmItem_OptionBarComponent(
                how_send: how_send,
                address_select: address_select,
                how_pay: how_pay,
                active: active,
                data: this.widget.data,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> SetHowSend(String _hs) {
    setState(() {
      how_send = _hs;
    });

    SetActive();
  }

  Future<void> SetAddressSelect(String _ac) {
    setState(() {
      address_select = _ac;
    });
    SetActive();
  }

  Future<void> SetHowPay(String hp) {
    setState(() {
      how_pay = hp;
    });
    SetActive();
  }

  Future<void> SetActive() {
    if (how_send != null && address_select != null && how_pay != null) {
      setState(() {
        active = 1;
      });
    } else {
      setState(() {
        active = 0;
      });
    }
  }
}
