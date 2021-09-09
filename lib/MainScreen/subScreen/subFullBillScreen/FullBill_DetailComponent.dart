import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/component/progress5H.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class FullBill_DetailComponent extends StatefulWidget {
  final GetBillFooderDataResponse data;
  FullBill_DetailComponent({@required this.data});
  @override
  _FullBill_DetailComponentState createState() =>
      _FullBill_DetailComponentState();
}

class _FullBill_DetailComponentState extends State<FullBill_DetailComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowBillID = Container(
      child: Column(
        children: [
          Text("เลขที่คำสั่งซื้อ"),
          Text("${this.widget.data.bill.bill_id}"),
        ],
      ),
    );
    Widget ShowDateBuy = Container(
      child: Text(
          "วันเวลาที่ทำการสั่งซื้อ ${this.widget.data.bill.date.ToString()}"),
    );

    Widget ShowDateSend = Container(
      child: Text(
          "วันที่ทำการส่งสินค้า ${this.widget.data.post_info.send.ToDateString()}"),
    );

    Widget ShowPayment = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("การชำระสินค้า"),
          this.widget.data.bill.how_pay == "1"
              ? Text("ชำระพร้อมเพย์")
              : Text("ชำระปลายทาง"),
        ],
      ),
    );
    Widget ShowPayStatus = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("สถานะการชำระ"),
          this.widget.data.bill.pay_status == "1"
              ? Text("ชำระแล้ว")
              : Text("ยังไม่ชำระ")
        ],
      ),
    );
    int totalmenu = 0;
    this.widget.data.bufferItems.forEach((key, value) {
      int _quantity = value.quantity;
      int _cost = this.widget.data.bufferInventory[value.inventory_id].cost;
      totalmenu += _quantity * _cost;
    });
    Widget ShowTotalMenu = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ยอดรวมของสินค้า"),
          Text("${totalmenu} บาท"),
        ],
      ),
    );

    Widget ShowSendCost = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ค่าจัดส่ง"),
          Text("${this.widget.data.post_info.sendCost} บาท"),
        ],
      ),
    );

    Widget ShowServiceCost = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ค่าบริการ"),
          Text("3 บาท"),
        ],
      ),
    );

    Widget ShowDiscount = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("ส่วนลด"), Text("0 บาท")],
      ),
    );

    Widget ShowTotal = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("รวม"),
          Text("${3 + totalmenu + this.widget.data.post_info.sendCost} บาท")
        ],
      ),
    );
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      padding: EdgeInsets.all(10),
      // color: Colors.green,
      // margin: EdgeInsets.all(20),
      child: ListView(
        children: [
          ShowBillID,
          SizedBox(
            height: 10,
          ),
          ShowDateBuy,
          ShowDateSend,
          SizedBox(
            height: 20,
          ),
          ShowPayment,
          ShowPayStatus,
          ShowTotalMenu,
          ShowSendCost,
          ShowServiceCost,
          ShowDiscount,
          ShowTotal,
          SizedBox(
            height: 50,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Column(
              children: [
                Text("สถานะของสินค้า"),
                Expanded(
                  child: Progress5H(
                      progressStep: int.parse(this.widget.data.bill.status)),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
