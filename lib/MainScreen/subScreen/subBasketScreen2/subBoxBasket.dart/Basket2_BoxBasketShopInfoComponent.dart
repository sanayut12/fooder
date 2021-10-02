import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class Basket2_BoxBasketShopInfoComponent extends StatefulWidget {
  final BasketBox_shopInfo shop_info;
  Basket2_BoxBasketShopInfoComponent({@required this.shop_info});
  @override
  _Basket2_BoxBasketShopInfoComponentState createState() =>
      _Basket2_BoxBasketShopInfoComponentState();
}

class _Basket2_BoxBasketShopInfoComponentState
    extends State<Basket2_BoxBasketShopInfoComponent> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    Widget ImageShop = Container(
      height: weight_screen * 0.14,
      width: weight_screen * 0.14,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.shop_info.image}"))),
    );
    Widget NameShop = GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.grey[200];
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Colors.transparent;
        });
        await Future.delayed(Duration(milliseconds: 50));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        color: color,
        child: Text(
          "${this.widget.shop_info.name}",
          style: TextStyle(
              fontSize: weight_screen * 0.06, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Container(
      height: weight_screen * 0.15,
      width: double.infinity,
      child: Row(
        children: [ImageShop, NameShop],
      ),
    );
  }
}
