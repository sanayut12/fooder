import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/MainScreen/component/progress5W.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/module/socketioManagerForgound.dart';

class Bill2Box_ProgressWComponent extends StatefulWidget {
  GetBillFooderDataResponse data;
  Bill2Box_ProgressWComponent({@required this.data});
  @override
  _Bill2Box_ProgressWComponentState createState() =>
      _Bill2Box_ProgressWComponentState();
}

class _Bill2Box_ProgressWComponentState
    extends State<Bill2Box_ProgressWComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocketioManagerForgound().subscript(
        "bill_progress_step:${this.widget.data.bill.bill_id}", setValue);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SocketioManagerForgound()
        .unsubscript("bill_progress_step:${this.widget.data.bill.bill_id}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.4),
      child: Progress5W(progressStep: int.parse(this.widget.data.bill.status)),
    );
  }

  Future<void> setValue(String data) {
    print(data);
    Map dataJson = json.decode(data);
    String status = dataJson['status'];
    setState(() {
      this.widget.data.bill.status = status;
    });
  }
}
