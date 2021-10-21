import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_BoxBasketOptionComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_BoxBasketShopInfoComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_BoxBasketTimeStopComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/subBoxBasket.dart/Basket2_boxBasketItemComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class Basket2_BoxBasketComponent extends StatefulWidget {
  String language;
  GetItemInBasket_ItemsResponse data;
  Function ChangeLoad;
  Basket2_BoxBasketComponent(
      {@required this.language,
      @required this.data,
      @required this.ChangeLoad});
  @override
  _Basket2_BoxBasketComponentState createState() =>
      _Basket2_BoxBasketComponentState();
}

class _Basket2_BoxBasketComponentState
    extends State<Basket2_BoxBasketComponent> {
  bool check = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    return check
        ? Container(
            width: double.infinity,
            // height: 100,
            margin: EdgeInsets.only(
                left: weight_screen * 0.01,
                right: weight_screen * 0.01,
                bottom: 3,
                top: 2),
            padding: EdgeInsets.all(weight_screen * 0.03),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Column(
              children: [
                Basket2_BoxBasketShopInfoComponent(
                    shop_info: this.widget.data.shop_info),
                // ShowAllMenu,
                Basket2_ListMenu(
                  language: this.widget.language,
                  data: this.widget.data,
                  ChangeLoad: this.widget.ChangeLoad,
                ),
                Basket2_BoxBasketTimeStopComponent(
                    language: this.widget.language,
                    post_info: this.widget.data.post_info),
                // Basket2_BoxBasketTotalCostComponent(data: data),

                Basket2_BoxBasketOptionComponent(
                  data: this.widget.data,
                  DeleteBasket: DeleteBasket,
                )
              ],
            ),
            // color: data == null ? Colors.red : Colors.blue,
            // child: Text("${this.widget.post_id}"),
          )
        : Container();
  }

  Future<void> DeleteBasket() {
    setState(() {
      check = false;
    });
  }
}

class Basket2_ListMenu extends StatefulWidget {
  String language;
  GetItemInBasket_ItemsResponse data;
  Function ChangeLoad;
  Basket2_ListMenu(
      {@required this.language,
      @required this.data,
      @required this.ChangeLoad});

  @override
  _Basket2_ListMenuState createState() => _Basket2_ListMenuState();
}

class _Basket2_ListMenuState extends State<Basket2_ListMenu> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    int len = this.widget.data.bufferItem.length;

    List<Basket2_boxBasketItemComponent> bufferWidget = [];

    List<String> bufferitem_id = this.widget.data.bufferItem.keys.toList();
    for (String item_id in bufferitem_id) {
      bufferWidget.add(Basket2_boxBasketItemComponent(
        language: this.widget.language,
        item_id: item_id,
        data: this.widget.data,
        ChangeLoad: this.widget.ChangeLoad,
      ));
    }
    return Container(
      height: len * 0.18 * weight_screen,
      width: double.infinity,
      child: Column(
        children: bufferWidget,
      ),
    );
  }
}
