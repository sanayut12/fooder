import 'package:flutter/cupertino.dart';

class ConfirmMenuOrderInBasketRequest {
  final String user_id, post_id, address_user_id;
  ConfirmMenuOrderInBasketRequest(
      {@required this.user_id,
      @required this.post_id,
      @required this.address_user_id});

  Map<String, dynamic> value() {
    return {
      "user_id": this.user_id,
      "post_id": this.post_id,
      "address_user_id": this.address_user_id
    };
  }
}

class ConfirmMenuOrderInBasketResponse {
  final String code;
  ConfirmMenuOrderInBasketResponse({@required this.code});
}
