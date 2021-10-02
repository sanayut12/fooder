import 'package:flutter/cupertino.dart';

class ChangeQuantityItemInBasketRequest {
  String item_id;
  int quantity;
  ChangeQuantityItemInBasketRequest(
      {@required this.item_id, @required this.quantity});

  Map<String, dynamic> value() {
    return {"item_id": this.item_id, "quantity": this.quantity};
  }
}

class ChangeQuantityItemInBasketReqsponse {
  String code;
  ChangeQuantityItemInBasketReqsponse({@required this.code});
}
