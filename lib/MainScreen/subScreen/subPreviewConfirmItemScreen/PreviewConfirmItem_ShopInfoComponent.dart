import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class PreviewConfirmItem_ShopInfoComponent extends StatefulWidget {
  final BasketBox_shopInfo shop_info;
  PreviewConfirmItem_ShopInfoComponent({@required this.shop_info});
  @override
  _PreviewConfirmItem_ShopInfoComponentState createState() =>
      _PreviewConfirmItem_ShopInfoComponentState();
}

class _PreviewConfirmItem_ShopInfoComponentState
    extends State<PreviewConfirmItem_ShopInfoComponent> {
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
