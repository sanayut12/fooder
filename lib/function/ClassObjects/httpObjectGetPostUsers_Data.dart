import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class GetPostUsersDataRequest {
  String post_users_id;
  GetPostUsersDataRequest({@required this.post_users_id});
  Map<String, dynamic> value() {
    return {"post_users_id": this.post_users_id};
  }
}

class GetPostUsersDataResponse {
  GetPostUsers_PostInfo post_info;
  String code;

  GetPostUsersDataResponse({@required this.post_info, @required this.code});
}

class GetPostUsers_PostInfo {
  String post_users_id, user_id, message, status;
  List<String> bufferImage;
  DateBox date;
  double latitude, longtitude;
  GetPostUsers_PostInfo(
      {@required this.post_users_id,
      @required this.user_id,
      @required this.message,
      @required this.bufferImage,
      @required this.date,
      @required this.latitude,
      @required this.longtitude,
      @required this.status});
}
