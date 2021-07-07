import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPhoneComponent extends StatefulWidget {
  final Function set_phone;
  AddPhoneComponent({@required this.set_phone});
  @override
  _AddPhoneComponentState createState() => _AddPhoneComponentState();
}

class _AddPhoneComponentState extends State<AddPhoneComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ใส่เบอร์โทรศัพท์"),
          TextFormField(
            onChanged: (e) => {this.widget.set_phone(e)},
          ),
        ],
      ),
    );
  }
}
