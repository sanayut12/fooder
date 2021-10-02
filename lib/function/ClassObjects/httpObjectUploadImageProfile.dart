import 'package:flutter/cupertino.dart';

class UploadImageProfileRequest {
  final String user_id, image;
  UploadImageProfileRequest({@required this.user_id, @required this.image});
  Map<String, dynamic> value() {
    return {"user_id": this.user_id, "image": this.image};
  }
}

class UploadImageProfileResponse {
  final String code;
  UploadImageProfileResponse({@required this.code});
}
