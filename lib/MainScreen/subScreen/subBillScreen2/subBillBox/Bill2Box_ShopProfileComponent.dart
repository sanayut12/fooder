import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class Bill2Box_ShopProfileComponent extends StatefulWidget {
  final GetBillFooderDataResponse data;
  Bill2Box_ShopProfileComponent({@required this.data});
  @override
  _Bill2Box_ShopProfileComponentState createState() =>
      _Bill2Box_ShopProfileComponentState();
}

class _Bill2Box_ShopProfileComponentState
    extends State<Bill2Box_ShopProfileComponent> {
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
                  "${HostName()}/image/ImageProfileShop/${this.widget.data.shop_info.image}"))),
    );

    Widget ShowName = Container(
      child: Text("${this.widget.data.shop_info.name}"),
    );

    Widget BillStatus = Expanded(
        child: Container(
      alignment: Alignment.bottomRight,
      child: this.widget.data.bill.pay_status == "1"
          ? Text(
              "จ่ายแล้ว",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            )
          : Text(
              "ยังไม่จ่าย",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
    ));
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: double.infinity,
      // color: Colors.black,
      child: Row(
        children: [ShowImage, ShowName, BillStatus],
      ),
    );
  }
}
