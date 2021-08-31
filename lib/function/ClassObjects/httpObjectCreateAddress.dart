import 'package:flutter/cupertino.dart';

class CreateAddressRequest {
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
  CreateAddressRequest(
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

  Map<String, dynamic> value() {
    return {
      "user_id": this.user_id,
      "name": this.name,
      "phone": this.phone,
      "address": this.address,
      "no": this.no,
      "moo": this.moo,
      "baan": this.baan,
      "road": this.road,
      "soy": this.soy,
      "sub_district": this.sub_district,
      "district": this.district,
      "province": this.province,
      "latitude": this.latitude,
      "longtitude": this.longtitude
    };
  }
}

class CreateAddressResponse {
  final String code;
  CreateAddressResponse({@required this.code});
}
