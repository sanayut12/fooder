import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class Bill2Box_Billstatus2Component extends StatefulWidget {
  final GetBillFooderDataResponse data;
  Bill2Box_Billstatus2Component({@required this.data});
  @override
  _Bill2Box_Billstatus2ComponentState createState() =>
      _Bill2Box_Billstatus2ComponentState();
}

class _Bill2Box_Billstatus2ComponentState
    extends State<Bill2Box_Billstatus2Component> {
  @override
  Widget build(BuildContext context) {
    Widget ShowDateSend = Container(
      child: Text(
          "วันที่จัดส่ง${this.widget.data.post_info.send.ToDateString()} ${this.widget.data.post_info.send.ToTimeString()}"),
    );
    return Container(
      // height: ,
      child: ShowDateSend,
    );
  }
}
