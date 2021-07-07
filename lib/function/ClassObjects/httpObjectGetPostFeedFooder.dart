import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class GetPostFoodFooderRequest {
  final String user_id;
  final double latitude, longtitude;
  final DateBox date_now, date_last;

  GetPostFoodFooderRequest(
      {@required this.user_id,
      @required this.latitude,
      @required this.longtitude,
      @required this.date_now,
      this.date_last});

  Map<String, dynamic> value() {
    DateBox _date_now = this.date_now;
    DateBox _date_last = this.date_last;
    var data = {
      "user_id": this.user_id,
      "position": {"latitude": this.latitude, "longtitude": this.longtitude},
      "date_now": {
        'year': _date_now.year,
        'month': _date_now.month,
        'day': _date_now.day,
        'hour': _date_now.hour,
        'min': _date_now.min,
        'sec': _date_now.sec
      },
      "date_last": {
        'year': _date_now.year,
        'month': _date_now.month,
        'day': _date_now.day,
        'hour': _date_now.hour,
        'min': _date_now.min,
        'sec': _date_now.sec
      }
    };
    return data;
  }
}

class GetPostFoodFooderResponse {
  final Map<String, DataShopInfo> bufferDataShopInfo;
  final Map<String, DataPost> bufferDataPost;
  GetPostFoodFooderResponse(
      {@required this.bufferDataShopInfo, @required this.bufferDataPost});
}
