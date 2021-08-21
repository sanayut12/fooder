import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class OneBillProfileComponent extends StatefulWidget {
  final ShopInfoBill shopInfoBill; //< data>  มีร้านเดียวเท่านั้น
  OneBillProfileComponent({@required this.shopInfoBill});
  @override
  _OneBillProfileComponentState createState() =>
      _OneBillProfileComponentState();
}

class _OneBillProfileComponentState extends State<OneBillProfileComponent> {
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
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      child: Text("${this.widget.shopInfoBill.name}"),
    );
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [ImageShop, Expanded(child: NameShop)],
      ),
    );
  }
}
