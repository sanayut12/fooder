import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class GetPostFoodFooderPostShopRequest {
  final String post_id;

  GetPostFoodFooderPostShopRequest({@required this.post_id});

  Map<String, dynamic> value() {
    var data = {"post_id": this.post_id};
    return data;
  }
}

class GetPostFoodFooderPostShopResponse {
  final Map<String, DataShopInfo> bufferDataShopInfo;
  final Map<String, DataPost> bufferDataPost;
  GetPostFoodFooderPostShopResponse(
      {@required this.bufferDataShopInfo, @required this.bufferDataPost});
}
