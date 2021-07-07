import 'package:flutter/cupertino.dart';

class GetAllAddressRequest {
  final String user_id;
  GetAllAddressRequest({@required this.user_id});

  Map<String, dynamic> value() {
    return {"user_id": this.user_id};
  }
}

class GetAllAddressResponse {
  final Map<int, AddressBox> bufferAddressBox;
  final String code;
  GetAllAddressResponse({@required this.bufferAddressBox, @required this.code});
  List<int> listkey() {
    List<int> bufferListKey = <int>[];
    this.bufferAddressBox.forEach((key, value) {
      bufferListKey.add(key);
    });
    return bufferListKey;
  }
}

class AddressBox {
  final String address_user_id,
      phone,
      address,
      sub_district,
      district,
      province;
  final double latitude, longtitude;
  AddressBox(
      {@required this.address_user_id,
      @required this.phone,
      @required this.address,
      @required this.sub_district,
      @required this.district,
      @required this.province,
      @required this.latitude,
      @required this.longtitude});
}
