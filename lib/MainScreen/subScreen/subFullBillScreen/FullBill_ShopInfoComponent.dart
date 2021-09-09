import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class FullBill_ShopInfoComponent extends StatefulWidget {
  final BillFooder_ShopInfo shop_info;
  FullBill_ShopInfoComponent({@required this.shop_info});
  @override
  _FullBill_ShopInfoComponentState createState() =>
      _FullBill_ShopInfoComponentState();
}

class _FullBill_ShopInfoComponentState
    extends State<FullBill_ShopInfoComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowImage = Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.shop_info.image}"))),
    );

    Widget ShowName = Container(
      child: Text("${this.widget.shop_info.name}"),
    );
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: double.infinity,
      child: Row(
        children: [ShowImage, ShowName],
      ),
    );
  }
}
