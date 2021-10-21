import 'package:flutter/cupertino.dart';

class GetPostTrackRequest {
  String post_id;
  GetPostTrackRequest({@required this.post_id});
  Map<String, String> value() {
    return {"post_id": this.post_id};
  }
}

class GetPostTrackResponse {
  GetPostTrack_post post_info;
  List<String> bufferMenu;
  String code;
  GetPostTrackResponse(
      {@required this.post_info,
      @required this.bufferMenu,
      @required this.code});
}

class GetPostTrack_post {
  String post_id, detail;
  GetPostTrack_post({@required this.post_id, @required this.detail});
}
