import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/PaymentScreen.dart';
import 'package:fooder/MainScreen/subScreen/PreviewConfirmItemScreen.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_OptionBarComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class Basket2_BoxBasketOptionComponent extends StatefulWidget {
  final int index;
  final GetItemInBasket_ItemsResponse data;
  final Function DeleteBasket;
  Basket2_BoxBasketOptionComponent(
      {@required this.data, @required this.index, @required this.DeleteBasket});
  @override
  _Basket2_BoxBasketOptionComponentState createState() =>
      _Basket2_BoxBasketOptionComponentState();
}

class _Basket2_BoxBasketOptionComponentState
    extends State<Basket2_BoxBasketOptionComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonModel(String text, Function fun) => GestureDetector(
          onTap: () {
            fun();
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Text("${text}"),
          ),
        );
    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: ButtonModel("ยกเลิก", null)),
          Expanded(child: ButtonModel("ทำการสั่งซื้อ", DoBuy))
        ],
      ),
    );
  }

  Future<void> DoBuy() async {
    PreviewConfirmItem_return data_pop =
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PreviewConfirmItemScreen(
                  data: this.widget.data,
                )));
    if (data_pop == null) {
      print("ว่าง");
    } else {
      this.widget.DeleteBasket();
      print("ไม่ว่าง");
      if (data_pop.how_pay == "1") {
        print("ชำระพร้อมเพย์");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                PaymentScreen(bill_id: data_pop.bill_id)));
      } else {
        print("ชำระปลายทาง");
      }
    }
  }
}
