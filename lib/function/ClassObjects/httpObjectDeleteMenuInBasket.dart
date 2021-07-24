import 'package:flutter/material.dart';

class DeleteMenuInBasketRequest {
  final String item_id;
  DeleteMenuInBasketRequest({@required this.item_id});
}

class DeleteMenuInBasketResponse {
  final String code;
  DeleteMenuInBasketResponse({@required this.code});
}
