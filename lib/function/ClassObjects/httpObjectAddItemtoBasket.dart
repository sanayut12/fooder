import 'package:flutter/cupertino.dart';

class AddItemTobasketRequest {
  final String user_id, inventory_id, comment;
  final int quantity;
  AddItemTobasketRequest(
      {@required this.user_id,
      @required this.inventory_id,
      @required this.quantity,
      @required this.comment});

  Map<String, dynamic> value() {
    return {
      "user_id": this.user_id,
      "inventory_id": this.inventory_id,
      "quantity": this.quantity,
      "comment": this.comment
    };
  }
}

class AddItemToBasketResponse {
  final String code;
  AddItemToBasketResponse({@required this.code});
}
