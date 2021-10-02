import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CreateAddressUser_InputComponent extends StatefulWidget {
  final String name, phone, address, no, moo, baan, road, soy;
  final Function setData;
  CreateAddressUser_InputComponent(
      {@required this.name,
      @required this.phone,
      @required this.address,
      @required this.no,
      @required this.moo,
      @required this.baan,
      @required this.road,
      @required this.soy,
      @required this.setData});
  @override
  _CreateAddressUser_InputComponentState createState() =>
      _CreateAddressUser_InputComponentState();
}

class _CreateAddressUser_InputComponentState
    extends State<CreateAddressUser_InputComponent> {
  TextEditingController _name, _phone, _address, _no, _moo, _baan, _road, _soy;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _name = TextEditingController(text: this.widget.name);
      _phone = TextEditingController(text: this.widget.phone);
      _address = TextEditingController(text: this.widget.address);
      _no = TextEditingController(text: this.widget.no);
      _moo = TextEditingController(text: this.widget.moo);
      _baan = TextEditingController(text: this.widget.baan);
      _road = TextEditingController(text: this.widget.road);
      _soy = TextEditingController(text: this.widget.soy);
    });
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    Widget InputBox(Widget w) => Container(
          padding: EdgeInsets.only(left: 2, right: 2),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 0.5,
                    color: Colors.red,
                    offset: Offset(0.1, 0.1),
                    spreadRadius: 0.5)
              ],
              border: Border.all(color: Colors.grey[200]),
              borderRadius: BorderRadius.circular(weight_screen * 0.01)),
          child: w,
        );
    Widget InputName = InputBox(TextFormField(
      controller: _name,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: (e) {
        this.widget.setData(e, null, null, null, null, null, null, null);
      },
    ));
    Widget InputPhone = InputBox(TextFormField(
      controller: _phone,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: (e) {
        this.widget.setData(null, e, null, null, null, null, null, null);
      },
    ));
    Widget InputAddress = InputBox(TextFormField(
      controller: _address,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: (e) {
        this.widget.setData(null, null, e, null, null, null, null, null);
      },
    ));
    Widget InputNo = InputBox(TextFormField(
      controller: _no,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: (e) {
        this.widget.setData(null, null, null, e, null, null, null, null);
      },
    ));
    Widget InputMoo = InputBox(TextFormField(
      controller: _moo,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: (e) {
        this.widget.setData(null, null, null, null, e, null, null, null);
      },
    ));
    Widget InputBaan = InputBox(TextFormField(
      controller: _baan,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: (e) {
        this.widget.setData(null, null, null, null, null, e, null, null);
      },
    ));
    Widget InputRoad = InputBox(TextFormField(
      controller: _road,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: (e) {
        this.widget.setData(null, null, null, null, null, null, e, null);
      },
    ));
    Widget InputSoy = InputBox(TextFormField(
      controller: _soy,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: (e) {
        this.widget.setData(null, null, null, null, null, null, null, e);
      },
    ));
    TextStyle style =
        TextStyle(fontSize: weight_screen * 0.04, fontWeight: FontWeight.w800);
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ชื่อผู้รับ",
            style: style,
          ),
          InputName,
          Text(
            "เบอร์โทรศัพท์",
            style: style,
          ),
          InputPhone,
          Text(
            "ที่อยู่",
            style: style,
          ),
          InputAddress,
          Text(
            "เลขที่",
            style: style,
          ),
          InputNo,
          Text(
            "หมู่ที่",
            style: style,
          ),
          InputMoo,
          Text(
            "ชื่อหมู่บ้าน",
            style: style,
          ),
          InputBaan,
          Text(
            "ชื่อถนน",
            style: style,
          ),
          InputRoad,
          Text(
            "ชื่อซอย",
            style: style,
          ),
          InputSoy,
        ],
      ),
    );
  }
}
