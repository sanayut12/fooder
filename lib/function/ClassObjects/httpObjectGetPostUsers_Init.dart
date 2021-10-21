import 'package:flutter/cupertino.dart';

class GetPostUsersInitRequest {
  String user_id;
  GetPostUsersInitRequest({@required this.user_id});
  Map<String, dynamic> value() {
    return {"user_id": this.user_id};
  }
}

class GetPostUsersInitResponse {
  List<String> bufferPostUser_id;
  String code;

  GetPostUsersInitResponse(
      {@required this.bufferPostUser_id, @required this.code});
}
