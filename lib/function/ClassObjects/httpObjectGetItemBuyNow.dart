import 'package:flutter/cupertino.dart';

class GetItemBuyNowRequest {
  String user_id, post_id;
  GetItemBuyNowRequest({@required this.user_id, @required this.post_id});
  Map<String, dynamic> value() {
    return {"user_id": this.user_id, "post_id": this.post_id};
  }
}
