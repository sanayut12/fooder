// writePost

import 'package:flutter/cupertino.dart';

class WritePostUsersRequest {
  String user_id, message;
  List<String> bufferImages;
  double latitude, longtitude;
  WritePostUsersRequest(
      {@required this.user_id,
      @required this.message,
      @required this.bufferImages,
      @required this.latitude,
      @required this.longtitude});
  Map<String, dynamic> value() {
    return {
      "user_id": this.user_id,
      "message": this.message,
      "images": this.bufferImages,
      "latitude": this.latitude,
      "longtitude": this.longtitude
    };
  }
}

class WritePostUsersResponse {
  String code;
  WritePostUsersResponse({@required this.code});
}
