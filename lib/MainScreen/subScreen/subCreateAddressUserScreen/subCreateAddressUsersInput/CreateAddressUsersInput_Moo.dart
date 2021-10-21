import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CreateAddressUsersInput_Moo extends StatefulWidget {
  String moo;
  final Function fun;

  CreateAddressUsersInput_Moo({@required this.moo, @required this.fun});
  @override
  _CreateAddressUsersInput_MooState createState() =>
      _CreateAddressUsersInput_MooState();
}

class _CreateAddressUsersInput_MooState
    extends State<CreateAddressUsersInput_Moo> {
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: this.widget.moo);
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(fontSize: 18);
    TextStyle style2 = TextStyle(fontSize: 18);
    return Container(
      padding: EdgeInsets.only(
          left: weight_screen * 0.025, right: weight_screen * 0.025),
      margin: EdgeInsets.only(
          left: weight_screen * 0.025, right: weight_screen * 0.025),
      // color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "หมู่ที่",
            style: style,
          ),
          TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xfffa897b).withOpacity(0.6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    gapPadding: 0.1,
                    borderSide: BorderSide.none)),
            style: style2,
            onChanged: (e) {
              this.widget.fun(null, null, null, null, e, null, null, null);
            },
          )
        ],
      ),
    );
  }
}
