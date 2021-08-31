import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/readJsonAddress.dart';

class CreateAddressUser_SelectAddressComponent extends StatefulWidget {
  final String sub_district, district, province;
  final Function SetAddress;
  CreateAddressUser_SelectAddressComponent(
      {@required this.sub_district,
      @required this.district,
      @required this.province,
      @required this.SetAddress});
  @override
  _CreateAddressUser_SelectAddressComponentState createState() =>
      _CreateAddressUser_SelectAddressComponentState();
}

class _CreateAddressUser_SelectAddressComponentState
    extends State<CreateAddressUser_SelectAddressComponent> {
  List<String> ListProvince = [];
  List<String> ListDistrict = [];
  List<String> ListSub_District = [];

  String _province, _district, _sub_district;
  int _post_code;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadKeyProvince();
  }

  @override
  Widget build(BuildContext context) {
    ////////////////จัดลิสส์ ของดรอปดาวน์//////////////////////
    List<DropdownMenuItem<String>> ItemProvince =
        ListProvince.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${AddressThailand().ProvinceValue(provinceKey: value, language: 'th')}'),
      );
    }).toList();
    List<DropdownMenuItem<String>> ItemDistrict =
        ListDistrict.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${AddressThailand().DistrictValue(provinceKey: this.widget.province, districtKey: value, language: 'th')}'),
      );
    }).toList();
    List<DropdownMenuItem<String>> ItemSub_District =
        ListSub_District.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${AddressThailand().Sub_DistrictValue(provinceKey: this.widget.province, districtKey: this.widget.district, sub_districtKey: value, language: 'th')}'),
      );
    }).toList();
////////////////////////////////////////////////////////////////////
    Widget InputProvince = DropdownButton<String>(
      value: this.widget.province,
      items: ItemProvince,
      hint: Text(
        "เลือกจังหวัด",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        // print(e);
        this.widget.SetAddress(null, null, e);
        _province = e;
        LoadKeyDistrict();
        // this.widget.setProvince(e);
      },
    );
    Widget InputDistrict = DropdownButton<String>(
      value: this.widget.district,
      items: ItemDistrict,
      hint: Text(
        "เลือกอำเภอ",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        this.widget.SetAddress(null, e, this.widget.province);
        _district = e;
        LoadKeySubDistrict();
        // this.widget.setDistrict(e);
      },
    );
    Widget InputSub_District = DropdownButton<String>(
      value: this.widget.sub_district,
      items: ItemSub_District,
      hint: Text(
        "เลือกตำบล",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        _sub_district = e;

        this.widget.SetAddress(e, this.widget.district, this.widget.province);
        LoadPostCode();
        // this.widget.setSubDistrict(e);
      },
    );
    return Container(
      child: Column(
        children: [
          InputProvince,
          InputDistrict,
          InputSub_District,
          Text("รหัสไปรษณี ${_post_code == null ? '' : _post_code}")
        ],
      ),
    );
  }

  Future<void> LoadKeyProvince() async {
    AddressThailand addressThailand = AddressThailand();
    List<String> _listKeyProvince = await addressThailand.ProvinceKey();
    setState(() {
      ListProvince = _listKeyProvince;
      ListDistrict = [];
      ListSub_District = [];
      _post_code = null;
    });
  }

  Future<void> LoadKeyDistrict() async {
    AddressThailand addressThailand = AddressThailand();
    List<String> _listKeDistrict =
        await addressThailand.DistrictKey(provinceKey: _province);
    setState(() {
      ListDistrict = _listKeDistrict;
      ListSub_District = [];
      _post_code = null;
    });
  }

  Future<void> LoadKeySubDistrict() async {
    AddressThailand addressThailand = AddressThailand();
    List<String> _listKeSubDistrict = await addressThailand.Sub_DistrictKey(
        provinceKey: _province, districtKey: _district);

    setState(() {
      ListSub_District = _listKeSubDistrict;
    });
  }

  Future<void> LoadPostCode() async {
    AddressThailand addressThailand = AddressThailand();
    int post_code = await addressThailand.Post_CodeValue(
        provinceKey: _province,
        districtKey: _district,
        sub_districtKey: _sub_district);
    // (
    //     provinceKey: _province, districtKey: _district);

    setState(() {
      _post_code = post_code;
    });
  }
}
