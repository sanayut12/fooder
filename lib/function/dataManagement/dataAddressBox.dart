import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/readJsonAddress.dart';

class DataAddressBox {
  final String address, no, moo, baan, road, soy;
  final String sub_district, district, province; //เข้ารหัสอยู่
  DataAddressBox(
      {@required this.address,
      @required this.no,
      @required this.moo,
      @required this.baan,
      @required this.road,
      @required this.soy,
      @required this.sub_district,
      @required this.district,
      @required this.province});

  String ToString() {
    String _province = AddressThailand()
        .ProvinceValue(provinceKey: this.province, language: 'th');
    String _district = AddressThailand().DistrictValue(
        provinceKey: this.province, districtKey: this.district, language: 'th');
    String _sub_district = AddressThailand().Sub_DistrictValue(
        provinceKey: this.province,
        districtKey: this.district,
        sub_districtKey: this.sub_district,
        language: 'th');
    return "${this.address == '' ? '' : 'ที่อยู่ ' + this.address}${this.no == '' ? '' : ' เลขที่ ' + this.no}${this.moo == '' ? '' : ' หมู่ ' + this.moo}${this.baan == '' ? '' : ' บ ' + this.baan}${this.road == '' ? '' : ' ถ ' + this.road}${this.soy == '' ? '' : ' ซ ' + this.soy}${' ต. ' + _sub_district}${' อ. ' + _district}${' จ. ' + _province}";
  }

  // String test() {
  //   String _province = AddressThailand()
  //       .ProvinceValue(provinceKey: this.province, language: 'th');
  //   String _district = AddressThailand().DistrictValue(
  //       provinceKey: this.province, districtKey: this.district, language: 'th');
  //   String _sub_district = AddressThailand().Sub_DistrictValue(
  //       provinceKey: this.province,
  //       districtKey: this.district,
  //       sub_districtKey: this.sub_district,
  //       language: 'th');
  //   return "${this.address} ${this.no} ${this.moo} ${this.baan} ${this.road} ${this.soy} ${_sub_district} ${_district} ${_province}";
  // }
}
