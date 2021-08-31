import 'package:flutter/cupertino.dart';

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
}


//วิธีใช้ 
//Map<String ,DataAddressUser>  //## string คือ address_user_id