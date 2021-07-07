import 'package:flutter/cupertino.dart';

class AddMenuTobasketRequest {
  final String user_id, inventory_id, comment;
  final int quantity;
  AddMenuTobasketRequest(
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

class AddMenuToBasketResponse {
  final String code;
  AddMenuToBasketResponse({@required this.code});
}
