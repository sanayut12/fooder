import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectCreateAddress.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpCreateAddress.dart';

class CreateAddressUser_OptionBarComponent extends StatefulWidget {
  final String name, phone, address, no, moo, baan, road, soy;
  //
  final String sub_district, district, province;
  final double latitude, longtitude;
  final int active;
  CreateAddressUser_OptionBarComponent(
      {@required this.name,
      @required this.phone,
      @required this.address,
      @required this.no,
      @required this.moo,
      @required this.baan,
      @required this.road,
      @required this.soy,
      @required this.sub_district,
      @required this.district,
      @required this.province,
      @required this.latitude,
      @required this.longtitude,
      @required this.active});
  @override
  _CreateAddressUser_OptionBarComponentState createState() =>
      _CreateAddressUser_OptionBarComponentState();
}

class _CreateAddressUser_OptionBarComponentState
    extends State<CreateAddressUser_OptionBarComponent> {
  // int active = 0;
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.height;
    Widget ButtonModel(String text, Function fun, int act) => GestureDetector(
          onTap: () {
            if (act == 1) {
              fun();
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: act == 1 ? Colors.red : Colors.white),
            child: Text("${text}"),
          ),
        );
    return Container(
      height: weight_screen * 0.1,
      width: double.infinity,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: ButtonModel("ยกเลิก", Cancel, 1)),
          Expanded(child: ButtonModel("ยืนยัน", Confirm, this.widget.active))
        ],
      ),
    );
  }

  Future<void> Cancel() {
    Navigator.of(context).pop(null);
  }

  Future<void> Confirm() async {
    bool value = await httpCreateAddress();
    if (value) {
      Navigator.of(context).pop(true);
    } else {
      print("ลงทะเบียนที่อยู่ไม่สำเร็จ");
    }
  }

  Future<bool> httpCreateAddress() async {
    String user_id = UserInfoManagement().User_id();
    CreateAddressRequest bufferCreateAddressRequest = CreateAddressRequest(
        user_id: user_id,
        name: this.widget.name,
        phone: this.widget.phone,
        address: this.widget.address,
        no: this.widget.no,
        moo: this.widget.moo,
        baan: this.widget.baan,
        road: this.widget.road,
        soy: this.widget.soy,
        sub_district: this.widget.sub_district,
        district: this.widget.district,
        province: this.widget.province,
        latitude: this.widget.latitude,
        longtitude: this.widget.longtitude);
    CreateAddressResponse bufferCreateAddressResponse =
        await HttpCreateAddress(bufferCreateAddressRequest);
    if (bufferCreateAddressResponse.code == "20200") {
      return true;
    } else {
      return false;
    }
  }
}
