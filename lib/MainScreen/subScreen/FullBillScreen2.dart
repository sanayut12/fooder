import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen2/FullBill2_Appbar.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen2/FullBill2_ListMenuComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen2/FullBill2_ShopInfoComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen2/FullBill2_TableComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen2/FullBill2_TotalCostComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen2/FullBill2_UserInfoComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen2/FullBill2_detailComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class FullBillScreen2 extends StatefulWidget {
  GetBillFooderDataResponse data;
  FullBillScreen2({@required this.data});
  @override
  _FullBillScreen2State createState() => _FullBillScreen2State();
}

class _FullBillScreen2State extends State<FullBillScreen2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> Info = [
      Text("จากร้าน"),
      SizedBox(
        height: 5,
      ),
      FullBill2_ShopInfoComponent(data: this.widget.data),
      Text("ผู้รับ"),
      SizedBox(
        height: 5,
      ),
      FullBill2_UserInfoComponent(data: this.widget.data)
    ];
    double weight_screen = MediaQuery.of(context).size.width;

    List<Widget> Menu = [
      FullBill2_TableComponent(),
      FullBill2_ListMenuComponent(data: this.widget.data),
      FullBill2_TotalCostComponent(data: this.widget.data)
    ];

    List<Widget> Detail = [FullBill2_detailComponent(data: this.widget.data)];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
            child: Column(
          children: [
            FillBill2_Appbar(),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0, -0.8),
                        end: Alignment(0, 0.4),
                        colors: [Colors.white, Color(0xfffa897b)])),
                child: ListView(
                  children: [
                    FullBill2_box(column: Info),
                    FullBill2_box(column: Menu),
                    FullBill2_box(column: Detail)
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class FullBill2_box extends StatefulWidget {
  List<Widget> column;
  FullBill2_box({@required this.column});
  @override
  _FullBill2_boxState createState() => _FullBill2_boxState();
}

class _FullBill2_boxState extends State<FullBill2_box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.widget.column,
      ),
    );
  }
}
