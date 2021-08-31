import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataAddressUser.dart';

class GetAllAddressRequest {
  final String user_id;
  GetAllAddressRequest({@required this.user_id});

  Map<String, dynamic> value() {
    return {"user_id": this.user_id};
  }
}

class GetAllAddressResponse {
  final Map<String, DataAddressUser> bufferDataAddressUser;
  final String code;
  GetAllAddressResponse(
      {@required this.bufferDataAddressUser, @required this.code});
}

// class AddressBox {
//   final String address_user_id,
//       phone,
//       address,
//       sub_district,
//       district,
//       province;
//   final double latitude, longtitude;
//   AddressBox(
//       {@required this.address_user_id,
//       @required this.phone,
//       @required this.address,
//       @required this.sub_district,
//       @required this.district,
//       @required this.province,
//       @required this.latitude,
//       @required this.longtitude});
// }
