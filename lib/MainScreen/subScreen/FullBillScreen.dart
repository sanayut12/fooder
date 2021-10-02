import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/component/touchUpDownHeightConponend.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen/FullBil_TitleTableComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen/FullBill_DetailComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen/FullBill_ListMenuComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen/FullBill_ShopInfoComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFullBillScreen/FullBill_TitleComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class FullBillScreen extends StatefulWidget {
  GetBillFooderDataResponse data;
  FullBillScreen({@required this.data});
  @override
  _FullBillScreenState createState() => _FullBillScreenState();
}

class _FullBillScreenState extends State<FullBillScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: weight_screen * 0.15,
        backgroundColor: Color(0xfffa897b),
        shadowColor: Colors.transparent,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text("รายละเอียดคำสั่งซื้อ"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            // FullBill_TitleComponent(),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView(
                      children: [
                        FullBill_ShopInfoComponent(
                            shop_info: this.widget.data.shop_info),
                        FullBil_TitleTableComponent(),
                        FullBill_ListMenuComponent(data: this.widget.data),
                        // Text(
                        //   "datadwfdatadwf,lkfmrolmrdgkxmdkfgkmlxrdmlgjmlkrjddatadwf,lkfmrolmrdgkxmdkfgkmlxrdmlgjmlkrjd,lkfmrolmrdgkxmdkfgkmlxrdmlgjmlkrjd",
                        //   style: TextStyle(fontSize: 50),
                        // ),
                        SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  ),
                  TouchUpDownHeightConponend(
                    render: FullBill_DetailComponent(data: this.widget.data),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
