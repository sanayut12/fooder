import 'package:meta/meta.dart';

class GetAddressUserRequest {
  final String address_user_id;
  GetAddressUserRequest({@required this.address_user_id});
  Map<String, dynamic> value() {
    return {"address_user_id": this.address_user_id};
  }
}

class GetAddressUserResponse {
  final String address_user_id,
      user_id,
      phone,
      address,
      sub_district,
      district,
      province;
  final double latitude, longtitude;

  GetAddressUserResponse(
      {@required this.address_user_id,
      @required this.user_id,
      @required this.phone,
      @required this.address,
      @required this.sub_district,
      @required this.district,
      @required this.province,
      @required this.latitude,
      @required this.longtitude});
}
