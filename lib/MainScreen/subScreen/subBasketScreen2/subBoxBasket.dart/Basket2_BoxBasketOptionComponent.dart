import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/PaymentScreen.dart';
import 'package:fooder/MainScreen/subScreen/PreviewConfirmItemScreen.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_OptionBarComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class Basket2_BoxBasketOptionComponent extends StatefulWidget {
  GetItemInBasket_ItemsResponse data;
  Function DeleteBasket;
  Basket2_BoxBasketOptionComponent(
      {@required this.data, @required this.DeleteBasket});
  @override
  _Basket2_BoxBasketOptionComponentState createState() =>
      _Basket2_BoxBasketOptionComponentState();
}

class _Basket2_BoxBasketOptionComponentState
    extends State<Basket2_BoxBasketOptionComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    // Widget ButtonModel() => ;
    return Container(
      height: weight_screen * 0.1,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Basker2_ModelButton(text: "ยกเลิก", fun: null),
          Basker2_ModelButton(text: "ทำการสั่งซื้อ", fun: DoBuy)
        ],
      ),
    );
  }

  Future<void> DoBuy() async {
    PreviewConfirmItem_return data_pop =
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PreviewConfirmItemScreen(
                  mode: "1",
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

class Basker2_ModelButton extends StatefulWidget {
  String text;
  Function fun;
  Basker2_ModelButton({@required this.text, @required this.fun});
  @override
  _Basker2_ModelButtonState createState() => _Basker2_ModelButtonState();
}

class _Basker2_ModelButtonState extends State<Basker2_ModelButton> {
  Color color = Color(0xfffa897b);
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.white;
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Color(0xfffa897b);
        });
        await Future.delayed(Duration(milliseconds: 50));
        this.widget.fun();
      },
      child: Container(
        height: weight_screen * 0.1,
        width: weight_screen * 0.35,
        // margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: Text("${this.widget.text}"),
      ),
    );
  }
}
