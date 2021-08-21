import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class BillShopInfoComponent extends StatefulWidget {
  final ShopInfoBill shopInfoBill;
  BillShopInfoComponent({@required this.shopInfoBill});
  @override
  _BillShopInfoComponentState createState() => _BillShopInfoComponentState();
}

class _BillShopInfoComponentState extends State<BillShopInfoComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ImageShop = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.shopInfoBill.image}"))),
    );

    Widget NameShop = Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Text("${this.widget.shopInfoBill.name}"),
    );
    return Container(
      height: 80,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ImageShop, NameShop],
      ),
    );
  }
}
