import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_DetailComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_ListImage.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_NameMenuComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_OptionBar.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_OptionBuy.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_Status1Component.dart';

import 'package:fooder/function/dataManagement/dataPostBox.dart';

class BuyMenuScreen extends StatefulWidget {
  final DataMenu_PostBox dataMenu;
  final DataInventory_PostBox dataInventory;
  BuyMenuScreen({@required this.dataInventory, @required this.dataMenu});
  @override
  _BuyMenuScreenState createState() => _BuyMenuScreenState();
}

class _BuyMenuScreenState extends State<BuyMenuScreen> {
  int active = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("${this.widget.dataMenu.inventory_id}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print(":");
        if (active == 0) {
          Navigator.of(context).pop();
        } else {
          setState(() {
            active = 0;
          });
        }
        return;
      },
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.green,
                    child: ListView(
                      children: [
                        Text("เลือกซื้อสินค้า"),
                        BuyMenu_ListImageComponent(
                          dataInventory: this.widget.dataInventory,
                          dataMenu: this.widget.dataMenu,
                        ),
                        BuyMenu_NameMenuComponent(
                            dataMenu: this.widget.dataMenu),
                        BuyMenu_Status1Component(
                            dataInventory: this.widget.dataInventory),
                        BuyMenu_DetailComponent(
                          dataMenu: this.widget.dataMenu,
                        ),
                      ],
                    )),
              ),
              BuyMenu_OptionBuy(
                active: active,
                setActive: setActive,
              )
            ],
          ),
          BuyMenu_OptionBar(
            active: active,
            dataInventory: this.widget.dataInventory,
            dataMenu: this.widget.dataMenu,
          )
        ],
      )),
    );
  }

  // Future AddbasketMenu() {
  //   httpAddMenuTobasket();
  // }

  Future<void> setActive(int i) {
    setState(() {
      active = i;
    });
  }

  Future BuyNowMenu() {}
}
