import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    Widget ImageShop = Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.shop_info.image}"))),
    );
    Widget NameShop = Container(
      child: Text("${this.widget.shop_info.name}"),
    );
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [ImageShop, NameShop],
      ),
    );
  }
}
