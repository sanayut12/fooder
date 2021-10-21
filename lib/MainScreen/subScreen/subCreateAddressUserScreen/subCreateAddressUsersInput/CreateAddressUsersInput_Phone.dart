import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CreateAddressUsersInput_Phone extends StatefulWidget {
  String phone;
  final Function fun;

  CreateAddressUsersInput_Phone({@required this.phone, @required this.fun});
  @override
  _CreateAddressUsersInput_PhoneState createState() =>
      _CreateAddressUsersInput_PhoneState();
}

class _CreateAddressUsersInput_PhoneState
    extends State<CreateAddressUsersInput_Phone> {
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: this.widget.phone);
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
            "เบอร์โทรศัพท์",
            style: style,
          ),
          TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xfffa897b).withOpacity(0.6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    gapPadding: 0.1,
                    borderSide: BorderSide.none)),
            style: style2,
            onChanged: (e) {
              this.widget.fun(null, e, null, null, null, null, null, null);
            },
          )
        ],
      ),
    );
  }
}
