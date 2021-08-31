import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class Basket2_BoxBasketTimeStopComponent extends StatefulWidget {
  final BasketBox_PostInfo post_info;
  Basket2_BoxBasketTimeStopComponent({@required this.post_info});
  @override
  _Basket2_BoxBasketTimeStopComponentState createState() =>
      _Basket2_BoxBasketTimeStopComponentState();
}

class _Basket2_BoxBasketTimeStopComponentState
    extends State<Basket2_BoxBasketTimeStopComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowTimeStop = Container(
      child: Text("ปิดการขาย ${this.widget.post_info.stop.ToString()}"),
    );

    Widget ShowSendCost = Container(
      child: Text("ค่าส่ง ${this.widget.post_info.sendCost} บาท"),
    );
    return Container(
      // height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ShowTimeStop, ShowSendCost],
      ),
    );
  }
}
