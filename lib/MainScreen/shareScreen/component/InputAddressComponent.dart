import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/FirstScreen/login.dart';
import 'package:fooder/function/dataManagement/readJsonAddress.dart';

class InPutAddressComponent extends StatefulWidget {
  final Function set_address, set_addressthailand;
  InPutAddressComponent(
      {@required this.set_address, @required this.set_addressthailand});

  @override
  _InPutAddressComponentState createState() => _InPutAddressComponentState();
}

class _InPutAddressComponentState extends State<InPutAddressComponent> {
  List<String> ListProvince = [];
  List<String> ListDistrict = [];
  List<String> ListSub_District = [];
  AddressThailand addressThailand = AddressThailand();
  String _province, _district, _sub_district;
  int _post_code = 0;

  void init() async {
    List<String> listProvince = await addressThailand.ProvinceKey();
    // print(listProvince);
    setState(() {
      ListProvince = listProvince;
    });
  }

  Future<void> updateDistrictAfterSelectProvince() async {
    _district = null;
    _sub_district = null;
    ListDistrict = [];
    ListSub_District = [];
    List<String> listDistrict =
        await addressThailand.DistrictKey(provinceKey: _province);
    // print(listDistrict);
    setState(() {
      ListDistrict = listDistrict;
    });
    _post_code = 0;
  }

  Future<void> updateSub_DistrictAfterSelectProvince() async {
    _sub_district = null;
    ListSub_District = [];
    List<String> listSub_District = await addressThailand.Sub_DistrictKey(
        provinceKey: _province, districtKey: _district);
    // print(listSub_District);
    setState(() {
      ListSub_District = listSub_District;
    });
    _post_code = 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> ItemProvince =
        ListProvince.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${addressThailand.ProvinceValue(provinceKey: value, language: 'th')}'),
      );
    }).toList();

    List<DropdownMenuItem<String>> ItemDistrict =
        ListDistrict.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${addressThailand.DistrictValue(provinceKey: _province, districtKey: value, language: 'th')}'),
      );
    }).toList();

    List<DropdownMenuItem<String>> ItemSub_District =
        ListSub_District.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${addressThailand.Sub_DistrictValue(provinceKey: _province, districtKey: _district, sub_districtKey: value, language: 'th')}'),
      );
    }).toList();

    Widget InputProvince = DropdownButton<String>(
      value: _province,
      items: ItemProvince,
      hint: Text(
        "เลือกจังหวัด",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        setState(() {
          _province = e;
        });
        updateDistrictAfterSelectProvince();
      },
    );

    Widget InputDistrict = DropdownButton<String>(
      value: _district,
      items: ItemDistrict,
      hint: Text(
        "เลือกอำเภอ",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        setState(() {
          _district = e;
        });

        updateSub_DistrictAfterSelectProvince();
      },
    );

    Widget InputSub_District = DropdownButton<String>(
      value: _sub_district,
      items: ItemSub_District,
      hint: Text(
        "เลือกตำบล",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        setState(() {
          _sub_district = e;
          _post_code = addressThailand.Post_CodeValue(
              provinceKey: _province,
              districtKey: _district,
              sub_districtKey: _sub_district);
        });
        this.widget.set_addressthailand(_province, _district, _sub_district);
      },
    );
    Widget FormAddress = Container(
      height: 400,
      width: double.infinity,
      child: Form(
          child: Column(
        children: [
          InputProvince,
          InputDistrict,
          InputSub_District,
          Text("รหัสไปรษณีย์ ${_post_code}")
        ],
      )),
    );
    Widget addressComponent = Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 100,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ใส่ที่อยู่"),
          TextFormField(
            onChanged: (e) {
              this.widget.set_address(e);
            },
            maxLines: 3,
            decoration: InputDecoration(),
          )
        ],
      ),
    );

    return Container(
      height: 500,
      child: Column(
        children: [addressComponent, FormAddress],
      ),
    );
  }
}
