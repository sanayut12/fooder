import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/FullBillScreen.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_Billstatus1Component.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_MenuListComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_ProgressWComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_ShopProfileComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class Bill2_BillBoxComponent extends StatefulWidget {
  final GetBillFooderDataResponse data;
  Bill2_BillBoxComponent({@required this.data});
  @override
  _Bill2_BillBoxComponentState createState() => _Bill2_BillBoxComponentState();
}

class _Bill2_BillBoxComponentState extends State<Bill2_BillBoxComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OpenFullBill();
      },
      child: Container(
        // height: 200,
        width: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bill2Box_ShopProfileComponent(
              data: this.widget.data,
            ),
            // Text("ส่วนของ step progress"),
            Bill2Box_ProgressWComponent(data: this.widget.data),
            Bill2Box_Billstatus1Component(data: this.widget.data),
            Bill2Box_MenuListComponent(data: this.widget.data)
          ],
        ),
      ),
    );
  }

  Future<void> OpenFullBill() async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            FullBillScreen(data: this.widget.data)));
  }
}
