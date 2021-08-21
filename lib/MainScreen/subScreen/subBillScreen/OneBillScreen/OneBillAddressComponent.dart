import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAddressUser.dart';
import 'package:fooder/function/dataManagement/readJsonAddress.dart';
import 'package:fooder/function/http/httpGetAddressUser.dart';

class OneBillAddressComponent extends StatefulWidget {
  final String address_user_id;
  OneBillAddressComponent({@required this.address_user_id});

  @override
  _OneBillAddressComponentState createState() =>
      _OneBillAddressComponentState();
}

class _OneBillAddressComponentState extends State<OneBillAddressComponent> {
  String phone;
  String address;
  String sub_district;
  String district;
  String province;
  int post_code;
  double latitude, longtitude;
  GetAddressUserResponse data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpgetaddress();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ที่อยู่การจัดส่ง",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(
              "${address} ตำบล ${sub_district} อำเภอ ${district} จังหวัด ${province} รหัสไปรษณ์ ${post_code} โทรศัพท์ ${phone} "),
          // Text("data"),
        ],
      ),
    );
  }

  void httpgetaddress() async {
    GetAddressUserRequest bufferGetAddressUserRequest =
        GetAddressUserRequest(address_user_id: this.widget.address_user_id);
    GetAddressUserResponse bufferGetAddressUserResponse =
        await HttpGetAddressUser(
            bufferGetAddressUserRequest: bufferGetAddressUserRequest);
    String sub_districtKey = bufferGetAddressUserResponse.sub_district;
    String districtKey = bufferGetAddressUserResponse.district;
    String provinceKey = bufferGetAddressUserResponse.province;
    AddressThailand addressThailand = AddressThailand();

    String _province =
        addressThailand.ProvinceValue(provinceKey: provinceKey, language: "th");
    String _district = addressThailand.DistrictValue(
        provinceKey: provinceKey, districtKey: districtKey, language: "th");
    String _sub_district = addressThailand.Sub_DistrictValue(
        provinceKey: provinceKey,
        districtKey: districtKey,
        sub_districtKey: sub_districtKey,
        language: "th");
    int _post_code = addressThailand.Post_CodeValue(
        provinceKey: provinceKey,
        districtKey: districtKey,
        sub_districtKey: sub_districtKey);
    setState(() {
      data = bufferGetAddressUserResponse;
      phone = bufferGetAddressUserResponse.phone;
      address = bufferGetAddressUserResponse.address;
      sub_district = _sub_district;
      district = _district;
      province = _province;
      post_code = _post_code;
      latitude = bufferGetAddressUserResponse.latitude;
      longtitude = bufferGetAddressUserResponse.longtitude;
    });
  }
}
