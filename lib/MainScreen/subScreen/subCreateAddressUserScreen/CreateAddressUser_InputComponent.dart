import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Widget InputName = TextFormField(
      controller: _name,
      onChanged: (e) {
        this.widget.setData(e, null, null, null, null, null, null, null);
      },
    );
    Widget InputPhone = TextFormField(
      controller: _phone,
      onChanged: (e) {
        this.widget.setData(null, e, null, null, null, null, null, null);
      },
    );
    Widget InputAddress = TextFormField(
      controller: _address,
      onChanged: (e) {
        this.widget.setData(null, null, e, null, null, null, null, null);
      },
    );
    Widget InputNo = TextFormField(
      controller: _no,
      onChanged: (e) {
        this.widget.setData(null, null, null, e, null, null, null, null);
      },
    );
    Widget InputMoo = TextFormField(
      controller: _moo,
      onChanged: (e) {
        this.widget.setData(null, null, null, null, e, null, null, null);
      },
    );
    Widget InputBaan = TextFormField(
      controller: _baan,
      onChanged: (e) {
        this.widget.setData(null, null, null, null, null, e, null, null);
      },
    );
    Widget InputRoad = TextFormField(
      controller: _road,
      onChanged: (e) {
        this.widget.setData(null, null, null, null, null, null, e, null);
      },
    );
    Widget InputSoy = TextFormField(
      controller: _soy,
      onChanged: (e) {
        this.widget.setData(null, null, null, null, null, null, null, e);
      },
    );

    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ชื่อผู้รับ"),
          InputName,
          Text("เบอร์โทรศัพท์"),
          InputPhone,
          Text("ที่อยู่"),
          InputAddress,
          Text("เลขที่"),
          InputNo,
          Text("หมู่ที่"),
          InputMoo,
          Text("ชื่อหมู่บ้าน"),
          InputBaan,
          Text("ชื่อถนน"),
          InputRoad,
          Text("ชื่อซอย"),
          InputSoy,
        ],
      ),
    );
  }
}
