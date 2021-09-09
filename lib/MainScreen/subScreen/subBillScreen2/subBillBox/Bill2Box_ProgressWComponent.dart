import 'package:flutter/cupertino.dart';
import 'package:fooder/MainScreen/component/progress5W.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';

class Bill2Box_ProgressWComponent extends StatefulWidget {
  final GetBillFooderDataResponse data;
  Bill2Box_ProgressWComponent({@required this.data});
  @override
  _Bill2Box_ProgressWComponentState createState() =>
      _Bill2Box_ProgressWComponentState();
}

class _Bill2Box_ProgressWComponentState
    extends State<Bill2Box_ProgressWComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomRight,
      child: Progress5W(progressStep: int.parse(this.widget.data.bill.status)),
    );
  }
}
