import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class FullBill2_ShopInfoComponent extends StatefulWidget {
  GetBillFooderDataResponse data;
  FullBill2_ShopInfoComponent({@required this.data});
  @override
  _FullBill2_ShopInfoComponentState createState() =>
      _FullBill2_ShopInfoComponentState();
}

class _FullBill2_ShopInfoComponentState
    extends State<FullBill2_ShopInfoComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShopProfile = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.data.shop_info.image}"))),
    );
    Widget ShopName = Container(
      child: Text("${this.widget.data.shop_info.name}"),
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [ShopProfile, ShopName],
          ),
        ],
      ),
    );
  }
}
