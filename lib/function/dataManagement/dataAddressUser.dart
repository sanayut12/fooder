import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/readJsonAddress.dart';

class DataAddressUser {
  final String user_id,
      name,
      phone,
      address,
      no,
      moo,
      baan,
      road,
      soy,
      sub_district,
      district,
      province;
  final double latitude, longtitude;
  DataAddressUser(
      {@required this.user_id,
      @required this.name,
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
      @required this.longtitude});

  String ToString() {
    String _name = this.name == "" ? "" : "ชื่อ ${this.name}";
    String _phone = this.phone == "" ? "" : " เบอร์ ${this.phone} ";
    String _address = this.address == "" ? "" : " ${this.address} ";
    String _no = this.no == "" ? "" : " เลขที่ ${this.no}";
    String _moo = this.moo == "" ? "" : " หมู่ ${this.moo}";
    String _baan = this.baan == "" ? "" : " บ. ${this.baan}";
    String _road = this.road == "" ? "" : " ถ. ${this.road}";
    String _soy = this.soy == "" ? "" : " ซ. ${this.soy}";

    String _sub_district = AddressThailand().Sub_DistrictValue(
        provinceKey: this.province,
        districtKey: this.district,
        sub_districtKey: this.sub_district,
        language: 'th');
    String _district = AddressThailand().DistrictValue(
        provinceKey: this.province, districtKey: this.district, language: 'th');
    String _province = AddressThailand()
        .ProvinceValue(provinceKey: this.province, language: 'th');

    int _post_code = AddressThailand().Post_CodeValue(
        provinceKey: this.province,
        districtKey: this.district,
        sub_districtKey: this.sub_district);
    return "${_name}${_phone}${_address}${_no}${_moo}${_baan}${_road}${_soy} ${'ต. ' + _sub_district} ${'อ. ' + _district} ${'จ. ' + _province} รหัสไปรษณีย์ ${_post_code}";
  }
}


//วิธีใช้ 
//Map<String ,DataAddressUser>  //## string คือ address_user_id