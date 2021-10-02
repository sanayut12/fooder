import 'package:flutter/cupertino.dart';

class BuyNowItemRequest {
  String user_id, post_id, inventory_id;
  int quantity;
  BuyNowItemRequest(
      {@required this.user_id,
      @required this.post_id,
      @required this.inventory_id,
      @required this.quantity});

  Map<String, dynamic> value() {
    return {
      "user_id": this.user_id,
      "post_id": this.post_id,
      "inventory_id": this.inventory_id,
      "quantity": this.quantity
    };
  }
}

class BuyNowItemResponse {
  String code;
  BuyNowItemResponse({@required this.code});
}
