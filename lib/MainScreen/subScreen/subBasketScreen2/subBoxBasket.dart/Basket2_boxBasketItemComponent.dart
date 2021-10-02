import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectChangeQuantityItemInBasket.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import 'package:fooder/function/http/httpChangeQuantityItemInBasket.dart';

class Basket2_boxBasketItemComponent extends StatefulWidget {
  String language, item_id;
  GetItemInBasket_ItemsResponse data;
  Function ChangeLoad;
  Basket2_boxBasketItemComponent(
      {@required this.language,
      @required this.item_id,
      @required this.data,
      @required this.ChangeLoad});
  @override
  _Basket2_boxBasketItemComponentState createState() =>
      _Basket2_boxBasketItemComponentState();
}

class _Basket2_boxBasketItemComponentState
    extends State<Basket2_boxBasketItemComponent> {
  @override
  Widget build(BuildContext context) {
    //init data
    double weight_screen = MediaQuery.of(context).size.width;
    LanguageManagement lgm = LanguageManagement();

    //data
    String inventory_id =
        this.widget.data.bufferItem[this.widget.item_id].inventory_id;
    String menu_id = this.widget.data.bufferInventory[inventory_id].menu_id;

    //data format
    String name = this.widget.data.bufferMenu[menu_id].name;
    String image = this.widget.data.bufferMenu[menu_id].path;
    int quantity = this.widget.data.bufferItem[this.widget.item_id].quantity;
    int cost = this.widget.data.bufferInventory[inventory_id].cost;

    Widget MenuImage = Container(
      height: weight_screen * 0.18,
      width: weight_screen * 0.18,
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/menuImage/${image}"))),
    );

    Widget MenuDetail = Container(
      padding: EdgeInsets.only(left: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${name}"),
          // Text("${lgm.value('043', this.widget.language)} ${quantity}"),
          Text("${lgm.value('044', this.widget.language)} ${cost} บาท")
        ],
      ),
    );

    Widget ButtonQuantity = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonModel(icon: Icons.remove, fun: ChangeQuantity, status: -1),
          Text("${quantity}"),
          ButtonModel(icon: Icons.add, fun: ChangeQuantity, status: 1)
        ],
      ),
    );
    return Container(
      height: weight_screen * 0.18,
      width: double.infinity,
      child: Row(
        children: [
          MenuImage,
          Expanded(flex: 2, child: MenuDetail),
          Expanded(child: ButtonQuantity)
        ], //
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

class ButtonModel extends StatefulWidget {
  IconData icon;
  Function fun;
  int status;
  ButtonModel({@required this.icon, @required this.fun, @required this.status});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  Color color = Color(0xFFFA897B);
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        this.widget.fun(this.widget.status);
      },
      child: Container(
        padding: EdgeInsets.all(weight_screen * 0.01),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: Colors.grey[300])),
        child: Icon(this.widget.icon),
      ),
    );
  }
}
