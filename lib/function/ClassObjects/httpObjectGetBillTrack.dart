import 'package:flutter/cupertino.dart';

class GetBillTrackRequest {
  String bill_id;
  GetBillTrackRequest({@required this.bill_id});
  Map<String, String> value() {
    return {"bill_id": this.bill_id};
  }
}

class GetBillTrackResponse {
  GetBillTrack_Post post;
  Map<String, GetBillTrack_Item> bufferMenu;
  String code, bill_id;
  GetBillTrackResponse(
      {@required this.bill_id,
      @required this.post,
      @required this.bufferMenu,
      @required this.code});
}

class GetBillTrack_Post {
  String post_id, detail;
  GetBillTrack_Post({@required this.post_id, @required this.detail});
}

class GetBillTrack_Item {
  String name;
  int quantity;
  GetBillTrack_Item({@required this.name, @required this.quantity});
}
