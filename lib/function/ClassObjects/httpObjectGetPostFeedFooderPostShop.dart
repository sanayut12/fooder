import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class GetPostFeedFooderPostShopRequest {
  final String post_id;

  GetPostFeedFooderPostShopRequest({@required this.post_id});

  Map<String, dynamic> value() {
    var data = {"post_id": this.post_id};
    return data;
  }
}

class GetPostFeedFooderPostShopResponse {
  // ร้าน ข้อมูลโพสต์ ข้อมูล สตอก ข้อมูลอาหาร
  final DataShopInfo_PostBox dataShopInfo_PostBox;
  final DataPost_PostBox dataPost_PostBox;
  final List<DataInventory_PostBox> bufferDataInventory_PostBox;
  final Map<String, DataMenu_PostBox> bufferDataMenu_PostBox;

  GetPostFeedFooderPostShopResponse(
      {@required this.dataShopInfo_PostBox,
      @required this.dataPost_PostBox,
      @required this.bufferDataInventory_PostBox,
      @required this.bufferDataMenu_PostBox});
}
