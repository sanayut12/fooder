import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/BillShopInfoComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/PostBillComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';

class BillComponent extends StatefulWidget {
  final Bill bill;
  final ShopInfoBill shopInfoBill; //< data>  มีร้านเดียวเท่านั้น
  final Map<String, ItemBill> bufferItemBill; //<item_id ,data>
  final Map<String, MenuList> bufferMenuList; //<inventory_id , data>
  BillComponent(
      {@required this.bill,
      @required this.shopInfoBill,
      @required this.bufferItemBill,
      @required this.bufferMenuList});
  @override
  _BillComponentState createState() => _BillComponentState();
}

class _BillComponentState extends State<BillComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      // height: 200,
      color: Colors.red,
      child: Column(
        children: [
          BillShopInfoComponent(shopInfoBill: this.widget.shopInfoBill),
          // Text("${this.widget.bill.bill_id}"),
          PostBillComponent(
            bill: this.widget.bill,
            shopInfoBill: this.widget.shopInfoBill,
            bufferItemBill: this.widget.bufferItemBill,
            bufferMenuList: this.widget.bufferMenuList,
          )
        ],
      ),
    );
  }
}
