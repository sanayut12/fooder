import 'package:flutter/cupertino.dart';

class PreviewConfirmItem_RateServiceComponent extends StatefulWidget {
  @override
  _PreviewConfirmItem_RateServiceComponentState createState() =>
      _PreviewConfirmItem_RateServiceComponentState();
}

class _PreviewConfirmItem_RateServiceComponentState
    extends State<PreviewConfirmItem_RateServiceComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text("อัตราคาบริการ 3 บาท")],
      ),
    );
  }
}
