import 'package:flutter/cupertino.dart';

class AddAddressRequest {
  final String user_id, phone, address, sub_district, district, province;
  final double latitude, longtitude;
  AddAddressRequest(
      {@required this.user_id,
      @required this.phone,
      @required this.address,
      @required this.sub_district,
      @required this.district,
      @required this.province,
      @required this.latitude,
      @required this.longtitude});

  Map<String, dynamic> value() {
    return {
      "user_id": this.user_id,
      "phone": this.phone,
      "address": this.address,
      "sub_district": this.sub_district,
      "district": this.district,
      "province": this.province,
      "latitude": this.latitude,
      "longtitude": this.longtitude
    };
  }
}

class AddAddressResponse {
  final String code;
  AddAddressResponse({@required this.code});
}
