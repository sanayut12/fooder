import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';

class PreviewConfirmItem_TimeStopComponent extends StatefulWidget {
  final BasketBox_PostInfo post_info;
  PreviewConfirmItem_TimeStopComponent({@required this.post_info});
  @override
  _PreviewConfirmItem_TimeStopComponentState createState() =>
      _PreviewConfirmItem_TimeStopComponentState();
}

class _PreviewConfirmItem_TimeStopComponentState
    extends State<PreviewConfirmItem_TimeStopComponent> {
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
