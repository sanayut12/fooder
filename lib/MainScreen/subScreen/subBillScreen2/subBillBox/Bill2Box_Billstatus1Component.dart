import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class Bill2Box_Billstatus1Component extends StatefulWidget {
  final GetBillFooderDataResponse data;
  Bill2Box_Billstatus1Component({@required this.data});
  @override
  _Bill2Box_Billstatus1ComponentState createState() =>
      _Bill2Box_Billstatus1ComponentState();
}

class _Bill2Box_Billstatus1ComponentState
    extends State<Bill2Box_Billstatus1Component> {
  @override
  Widget build(BuildContext context) {
    Widget ShowBill_id = Container(
      child:
          Text("รหัสบิล ${this.widget.data.bill.bill_id.substring(0, 15)}..."),
    );

    return Container(
      // height: ,
      child: ShowBill_id,
    );
  }
}
