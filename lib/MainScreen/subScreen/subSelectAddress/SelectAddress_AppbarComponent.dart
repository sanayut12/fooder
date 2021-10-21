import 'package:flutter/cupertino.dart';
import 'package:fooder/module/BackButton.dart';

class SelectAddress_AppbarComponent extends StatefulWidget {
  @override
  _SelectAddress_AppbarComponentState createState() =>
      _SelectAddress_AppbarComponentState();
}

class _SelectAddress_AppbarComponentState
    extends State<SelectAddress_AppbarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [BackButton21(), Text("เลือกที่อยู่การจัดส่ง")],
      ),
    );
  }
}
