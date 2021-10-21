import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/BuyMenuScreen.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/subMenuBoxComponent/MenuBox_ButtonComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectAddItemtoBasket.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpAddItemToBasket.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class MenuBoxComponent extends StatefulWidget {
  String inventory_id;
  GetPostFeedFooderPostShopResponse data;
  final Function PopUpAddItemToBasket;
  MenuBoxComponent(
      {@required this.inventory_id,
      @required this.data,
      @required this.PopUpAddItemToBasket});
  @override
  _MenuBoxComponentState createState() => _MenuBoxComponentState();
}

class _MenuBoxComponentState extends State<MenuBoxComponent> {
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
    int quantity = this
        .widget
        .data
        .bufferDataInventory_PostBox[this.widget.inventory_id]
        .quantity;
    Widget SelectMenu = GestureDetector(
      onTap: () {
        selectMenu();
      },
      child: Container(
        height: 80,
        width: double.infinity,
        color: Colors.transparent,
      ),
    );

    Widget ImageMenu = Container(
      height: weight_screen * 0.4,
      width: weight_screen * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/menuImage/${image}"))),
    );
    ///////////////////////////////////////////////////////////////
    Widget DetailMenuBox = Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(top: 2, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        // color: Colors.amber,
      ),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("${name}")),
          Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text("฿ ${cost}")),
          Expanded(child: Container()),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: MenuBox_ButtonComponent(
                      text: "เพิ่มลงตะกร้า", fun: AddMenuToBasket)),
              Expanded(
                child: MenuBox_ButtonComponent(text: "ซื้อ", fun: selectMenu),
              ),
            ],
          ))
        ],
      ),
    );
    return Container(
      height: weight_screen * 0.8,
      width: weight_screen * 0.5,

      // color: Colors.red,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          ImageMenu,
          Expanded(child: DetailMenuBox),
        ], //, DetailMenu
      ),
    );
  }

  Future<void> selectMenu() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => BuyMenuScreen(
                  inventory_id: this.widget.inventory_id,
                  data: this.widget.data,
                )));
  }

  Future<void> AddMenuToBasket() async {
    String user_id = await UserInfoManagement().User_id();
    String inventory_id = this.widget.inventory_id;
    AddItemTobasketRequest bufferAddItemTobasketRequest =
        AddItemTobasketRequest(
            user_id: user_id, inventory_id: inventory_id, quantity: 1);
    AddItemToBasketResponse bufferAddItemToBasketResponse =
        await HttpAddMenuToBasket(
            bufferAddMenuTobasketRequest: bufferAddItemTobasketRequest);
    print(bufferAddItemToBasketResponse.code);
    if (bufferAddItemToBasketResponse.code == "20200") {
      this.widget.PopUpAddItemToBasket();
    }
    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    provider.UpdateBasket();
  }
}
