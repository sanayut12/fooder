import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class GetPostFoodFooderRequestInit {
  final String user_id;
  final double latitude, longtitude;

  GetPostFoodFooderRequestInit({
    @required this.user_id,
    @required this.latitude,
    @required this.longtitude,
  });

  Map<String, dynamic> value() {
    var data = {
      "user_id": this.user_id,
      "position": {"latitude": this.latitude, "longtitude": this.longtitude},
    };
    return data;
  }
}

class GetPostFoodFooderResponseInit {
  final Map<int, BufferIDFeed> bufferIDFeed;
  GetPostFoodFooderResponseInit({@required this.bufferIDFeed});

  int length() {
    return bufferIDFeed.length;
  }
}

class BufferIDFeed {
  final String id;
  final String type;
  BufferIDFeed({@required this.id, @required this.type});
}

//kmlmkm

