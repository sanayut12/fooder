import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/OneBillScreen/OneBillAddressComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/OneBillScreen/OneBillItemComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/OneBillScreen/OneBillProfileComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/OneBillScreen/OneBillTotalReferenceComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/OneBillScreen/StepProgressView.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';

class OneBillScreen extends StatefulWidget {
  final Bill bill;
  final ShopInfoBill shopInfoBill; //< data>  มีร้านเดียวเท่านั้น
  final Map<String, ItemBill> bufferItemBill; //<item_id ,data>
  final Map<String, MenuList> bufferMenuList; //<inventory_id , data>
  OneBillScreen(
      {@required this.bill,
      @required this.shopInfoBill,
      @required this.bufferItemBill,
      @required this.bufferMenuList});
  @override
  _OneBillScreenState createState() => _OneBillScreenState();
}

class _OneBillScreenState extends State<OneBillScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget BackButton = GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Icon(Icons.keyboard_backspace),
      ),
    );
    Widget TitileBar = Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 50, bottom: 5, top: 5),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Text(
          "รายละเอียดคำสั่งซื้อ",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
    Widget Bar = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      child: Row(
        children: [
          Expanded(flex: 2, child: BackButton),
          Expanded(flex: 8, child: TitileBar)
        ],
      ),
    );

    Widget UnderProfileBar = Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [Text("รหัสบิล"), Text("${this.widget.bill.bill_id}")],
      ),
    );
    Widget MenuListTitleTable = Container(
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 50,
            alignment: Alignment.center,
            child: Text(""),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("ชื่อ"),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("ราคาต่อหน่วย"),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("ราคารวม"),
          )),
        ],
      ),
    );
    Widget MenuListComponent = Container(
        height: 30 + (this.widget.bufferItemBill.length.toDouble() * 50),
        width: double.infinity,
        color: Colors.white,
        child: ListView.builder(
            itemCount: this.widget.bufferItemBill.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return MenuListTitleTable;
              } else {
                String item_id =
                    this.widget.bufferItemBill.keys.elementAt(index - 1);
                String inventory_id =
                    this.widget.bufferItemBill[item_id].inventory_id;
                return OneBillItemCommponent(
                  itemBill: this.widget.bufferItemBill[item_id],
                  menuList: this.widget.bufferMenuList[inventory_id],
                );
              }
            }));

    Widget DateSendComponent = Container(
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "วันที่เวลาที่จะจัดส่ง",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("วันที่ ${this.widget.bill.dateSend.ToDateString()}"),
          Text("เวลา ${this.widget.bill.dateSend.ToTimeString()}")
        ],
      ),
    );
    Widget Body = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.yellow,
      child: ListView(
        children: [
          StepProgressView(curStep: 4, width: 10, color: Colors.amber),
          OneBillProfileComponent(shopInfoBill: this.widget.shopInfoBill),
          UnderProfileBar,
          Text(
            "รายการสั่งซื้อ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          MenuListComponent,
          OneBillAddressComponent(
              address_user_id: this.widget.bill.address_user_id),
          DateSendComponent,
          OneBillTotalReferenceComponent(
              bill: this.widget.bill,
              bufferItemBill: this.widget.bufferItemBill,
              bufferMenuList: this.widget.bufferMenuList)
        ],
      ),
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(flex: 1, child: Bar),
            Expanded(flex: 9, child: Body),
          ],
        ),
      ),
    );
  }
}
