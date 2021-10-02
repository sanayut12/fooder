import 'package:flutter/cupertino.dart';

class GetItemQuantityRequest {
  String inventory_id;
  GetItemQuantityRequest({@required this.inventory_id});
  Map<String, dynamic> value() {
    return {"inventory_id": this.inventory_id};
  }
}

class GetItemQuantityResponse {
  String code;
  int quantity;
  GetItemQuantityResponse({@required this.quantity, @required this.code});
}
