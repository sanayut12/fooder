import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataOrderMenu.dart';

class GetOrderBasketFooderRequest {
  final String user_id;
  GetOrderBasketFooderRequest({@required this.user_id});
  Map<String, dynamic> value() {
    return {"user_id": this.user_id};
  }
}

class GetOrderBasketFooderResponse {
  final Basket basket;
  final String code;
  GetOrderBasketFooderResponse({@required this.basket, @required this.code});
}
