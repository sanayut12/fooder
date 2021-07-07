import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/shareScreen/component/InputAddressComponent.dart';
import 'package:fooder/MainScreen/shareScreen/component/InputPhoneComponent.dart';
import 'package:fooder/MainScreen/shareScreen/addPositionScreen.dart';

class AddAddressScreen extends StatefulWidget {
  final Function set_data;
  AddAddressScreen({@required this.set_data});
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  String phone, address, sub_district, district, province;
  // double latitude, longtitude;

  Future SetData() {
    this.widget.set_data(phone, address, province, district, sub_district);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: ListView(
        children: [
          AddPhoneComponent(set_phone: setstate_phone),
          InPutAddressComponent(
            set_address: setstate_address,
            set_addressthailand: setstatue_addressthialand,
          ),
          TextButton(
              onPressed: () {
                print("$phone $address $province $district $sub_district");
              },
              child: Text("Hello"))
        ],
      ),
    );
  }

  Future setstate_phone(String _phone) {
    print("$_phone");
    setState(() {
      phone = _phone;
    });
    SetData();
  }

  Future setstate_address(String _address) {
    setState(() {
      address = _address;
    });
    SetData();
  }

  Future setstatue_addressthialand(
      String _province, String _district, String _sub_district) {
    setState(() {
      province = _province;
      district = _district;
      sub_district = _sub_district;
    });
    SetData();
  }

  // Future setstate_position(double _latitude, double _longtitude) {
  //   setState(() {
  //     latitude = _latitude;
  //     longtitude = _longtitude;
  //   });
  // }
}
