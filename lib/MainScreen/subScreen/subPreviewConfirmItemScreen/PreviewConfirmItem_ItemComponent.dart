import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/subItemcomponent/PreviewConfirmItem_sub_ItemButtonComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectChangeQuantityItemInBasket.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/http/httpChangeQuantityItemInBasket.dart';

class PreviewConfirmItem_ItemComponent extends StatefulWidget {
  String item_id;
  GetItemInBasket_ItemsResponse data;
  Function ChangeLoad;
  PreviewConfirmItem_ItemComponent(
      {@required this.item_id, @required this.data, @required this.ChangeLoad});
  @override
  _PreviewConfirmItem_ItemComponentState createState() =>
      _PreviewConfirmItem_ItemComponentState();
}

class _PreviewConfirmItem_ItemComponentState
    extends State<PreviewConfirmItem_ItemComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    String inventory_id =
        this.widget.data.bufferItem[this.widget.item_id].inventory_id;
    String menu_id = this.widget.data.bufferInventory[inventory_id].menu_id;

    ///ชื่อไฟล?ภาพ
    String image = this.widget.data.bufferMenu[menu_id].path;

    //จำนวนที่จะสั่งซื้อ
    int quantity = this.widget.data.bufferItem[this.widget.item_id].quantity;

    //ชื่อสินค้า
    String name = this.widget.data.bufferMenu[menu_id].name;
    //ราคาของสินค้า
    int cost = this.widget.data.bufferInventory[inventory_id].cost;

    Widget MenuImage = Container(
      height: weight_screen * 0.18,
      width: weight_screen * 0.18,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(weight_screen * 0.01),
          // shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/menuImage/${image}"))),
    );

    Widget QuantityControl = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PreviewConfirmItem_sub_ItemButtonComponent(
            icon: Icons.remove,
            fun: ChangeQuantity,
            status: -1,
          ),
          Container(
              margin: EdgeInsets.only(left: 3, right: 3),
              child: Text("${quantity}")),
          PreviewConfirmItem_sub_ItemButtonComponent(
            icon: Icons.add,
            fun: ChangeQuantity,
            status: 1,
          )
        ],
      ),
    );
    Widget MenuDetail = Container(
      padding: EdgeInsets.only(left: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${name}",
            style: TextStyle(
                fontSize: weight_screen * 0.035, fontWeight: FontWeight.w800),
          ),
          Text("฿ ${cost}", style: TextStyle(fontSize: weight_screen * 0.035)),
        ],
      ),
    );

    Widget DeleteMenu = Container(
      // color: Colors.red,
      margin: EdgeInsets.only(top: 1, bottom: 1),
      alignment: Alignment.center,
      child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
    );
    return Container(
      height: weight_screen * 0.18,
      width: double.infinity,
      child: Row(
        children: [
          MenuImage,
          Expanded(flex: 3, child: MenuDetail),
          Expanded(flex: 2, child: QuantityControl),
          Expanded(child: DeleteMenu)
        ],
      ),
    );
  }

  Future<void> ChangeQuantity(int status) async {
    int quantity = this.widget.data.bufferItem[this.widget.item_id].quantity;
    int _quantity = quantity + (1 * status);
    if (_quantity > 0) {
      this.widget.ChangeLoad(true);
      ChangeQuantityItemInBasketRequest
          bufferChangeQuantityItemInBasketRequest =
          ChangeQuantityItemInBasketRequest(
              item_id: this.widget.item_id, quantity: _quantity);
      ChangeQuantityItemInBasketReqsponse
          bufferChangeQuantityItemInBasketReqsponse =
          await HttpChangeQuantityItemInBasket(
              bufferChangeQuantityItemInBasketRequest);
      this.widget.ChangeLoad(false);
      setState(() {
        this.widget.data.bufferItem[this.widget.item_id].quantity = _quantity;
      });
    }
  }
}
