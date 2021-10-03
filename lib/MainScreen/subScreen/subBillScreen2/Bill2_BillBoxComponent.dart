import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/FullBillScreen2.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_Billstatus1Component.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_Billstatus2Component.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_MenuListComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_ProgressWComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/subBillBox/Bill2Box_ShopProfileComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class Bill2_BillBoxComponent extends StatefulWidget {
  GetBillFooderDataResponse data;
  Bill2_BillBoxComponent({@required this.data});
  @override
  _Bill2_BillBoxComponentState createState() => _Bill2_BillBoxComponentState();
}

class _Bill2_BillBoxComponentState extends State<Bill2_BillBoxComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Bill2Box_ProgressWComponent(data: this.widget.data),
        GestureDetector(
          onTap: () {
            OpenFullBill();
          },
          child: Container(
            // height: 200,
            width: double.infinity,

            margin: EdgeInsets.only(
                bottom: 3,
                top: 2,
                left: weight_screen * 0.05,
                right: weight_screen * 0.05),
            padding: EdgeInsets.all(weight_screen * 0.03),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(weight_screen * 0.03),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bill2Box_ShopProfileComponent(
                  data: this.widget.data,
                ),
                // Text("ส่วนของ step progress"),

                Bill2Box_Billstatus1Component(data: this.widget.data),
                Bill2Box_MenuListComponent(data: this.widget.data),
                Bill2Box_Billstatus2Component(data: this.widget.data)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> OpenFullBill() async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            FullBillScreen2(data: this.widget.data)));
  }
}
