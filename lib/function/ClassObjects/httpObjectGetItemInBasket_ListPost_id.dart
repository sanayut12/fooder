import 'package:flutter/cupertino.dart';

class GetItemInBasket_ListPost_idRequest {
  final String user_id;
  GetItemInBasket_ListPost_idRequest({@required this.user_id});
  Map<String, dynamic> value() {
    return {'user_id': this.user_id};
  }
}

class GetItemInBasket_ListPost_idResponse {
  final List<String> bufferPost_id;
  final String code;
  GetItemInBasket_ListPost_idResponse(
      {@required this.bufferPost_id, @required this.code});
}
