import 'package:flutter/cupertino.dart';

class GetPostFeedFooderRequestInit {
  final String user_id;
  final double latitude, longtitude;

  GetPostFeedFooderRequestInit({
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

class GetPostFeedFooderResponseInit {
  final Map<int, BufferIDFeed> bufferIDFeed;
  GetPostFeedFooderResponseInit({@required this.bufferIDFeed});

  int length() {
    return bufferIDFeed.length;
  }
}

class BufferIDFeed {
  final String post_id;
  final String type;
  BufferIDFeed({@required this.post_id, @required this.type});
}

//kmlmkm

