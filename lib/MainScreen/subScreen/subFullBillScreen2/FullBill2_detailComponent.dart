import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fooder/MainScreen/subScreen/ChangePayScreen.dart';
import 'package:fooder/MainScreen/subScreen/PaymentScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectChangeHowPay.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:fooder/function/http/httpChangeHowPay.dart';

class FullBill2_detailComponent extends StatefulWidget {
  GetBillFooderDataResponse data;
  FullBill2_detailComponent({@required this.data});
  @override
  _FullBill2_detailComponentState createState() =>
      _FullBill2_detailComponentState();
}

class _FullBill2_detailComponentState extends State<FullBill2_detailComponent> {
  @override
  Widget build(BuildContext context) {
    ////////////////////ส่วนของการประมวลผล/////////////////////////
    String bill_id = this.widget.data.bill.bill_id; //รหัสคำสั่งซื้อ
    DateBox start = this.widget.data.bill.date; //เวลาที่ทำการสั่งซื้อ
    DateBox send = this.widget.data.post_info.stop; //วันที่ต้องจัดส่งสินค้า

    String how_pay = this
        .widget
        .data
        .bill
        .how_pay; //วิธีการชำระสินค้า [1] ชำระผ่านแอป  [2] ชำระปลายทาง
    String pay_status = this
        .widget
        .data
        .bill
        .pay_status; //สถานะการชำระสินค้า [1] ชำระแล้ว [2] ยังไม่ชำระ
    /////////////////////////ส่วนของการแสดงผล/////////////////////////
    TextStyle style1 = TextStyle(
        fontSize: 15, color: Color(0xfffa897b), fontWeight: FontWeight.w800);
    TextStyle style2 = TextStyle(fontSize: 12);
    Widget BoxLevel1(String text) => Container(
          width: double.infinity,
          child: Text(
            "${text}",
            style: style1,
          ),
        );
    Widget BoxLevel2(String text) => Container(
          width: double.infinity,
          child: Text(
            "${text}",
            style: style2,
          ),
        );
    Widget BoxLevel3(String text, String value) => Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${text}",
                style: style2,
              ),
              Text(
                "${value}",
                style: style2,
              )
            ],
          ),
        );
    Widget Button = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          this.widget.data.bill.how_pay == "1"
              ? FullBill2_ButtonPay(text: "ชำระสินค้า", fun: Payment)
              : Container(),
          FullBill2_ButtonPay(text: "เปลี่ยนวิธีชำระสินค้า", fun: ChangePay)
        ],
      ),
    );
    return Container(
      child: Column(
        children: [
          BoxLevel1("เลขที่คำสั่งซื้อ"),
          BoxLevel2("${bill_id}"),
          BoxLevel3("วันเวลาที่สั่งซื้อสินค้า", "${start.ToString()}"),
          BoxLevel3("วันเวลาที่จัดส่งสินค้า", "${send.ToString()}"),
          BoxLevel1("การชำระสินค้า"),
          this.widget.data.bill.pay_status == "1" ? Container() : Button,
          BoxLevel3("วิธีการชำระสินค้า",
              "${how_pay == '1' ? 'ชำระพร้อมเพย์' : 'ชำระปลายทาง'}"),

          // BoxLevel3(
          //     "ชำระผ่าน", "${pay_status == '1' ? 'ชำระแล้ว' : 'ยังไม่ชำระ'}"),
          BoxLevel3("สถานะการชำระ",
              "${pay_status == '1' ? 'ชำระแล้ว' : 'ยังไม่ชำระ'}"),
          // Box2(text, "value"),
          // Box2(text, "")
        ],
      ),
    );
  }

  Future<void> ChangePay() async {
    String how_pay = this.widget.data.bill.how_pay;
    String bill_id = this.widget.data.bill.bill_id;
    print("dddddddddddddddddddddddd");
    if (how_pay == "1") {
      how_pay = "2";
    } else if (how_pay == "2") {
      how_pay = "1";
    }
    ChangeHowPayRequest bufferChangeHowPayRequest =
        ChangeHowPayRequest(bill_id: bill_id, how_pay: how_pay);
    ChangeHowPayResponse bufferChangeHowPayResponse = await HttpChangeHowPay(
        bufferChangeHowPayRequest: bufferChangeHowPayRequest);
    if (bufferChangeHowPayResponse.code == "20200") {
      setState(() {
        this.widget.data.bill.how_pay = "${how_pay}";
      });
    } else {}
  }

  Future<void> Payment() async {
    String bill_id = this.widget.data.bill.bill_id;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => PaymentScreen(bill_id: bill_id)));
  }
}

class FullBill2_ButtonPay extends StatefulWidget {
  String text;
  Function fun;
  FullBill2_ButtonPay({@required this.text, @required this.fun});
  @override
  _FullBill2_ButtonPayState createState() => _FullBill2_ButtonPayState();
}

class _FullBill2_ButtonPayState extends State<FullBill2_ButtonPay> {
  Color color = Color(0xfffa897b);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.white;
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Color(0xfffa897b);
        });
        this.widget.fun();
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: Text("${this.widget.text}"),
      ),
    );
  }
}
