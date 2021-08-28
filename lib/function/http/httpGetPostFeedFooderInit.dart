import 'dart:convert';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderInit.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//ใช้ ใช้ดึง post_id
Future<GetPostFeedFooderResponseInit> HttpGetPostFeedFooderInit(
    GetPostFeedFooderRequestInit bufferGetPostFoodFooderRequestInit) async {
  var body = bufferGetPostFoodFooderRequestInit.value();
  // print("$body");
  var url = Uri.parse(HostName() + "/post/getPostFeedFooderInit");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  Map res = jsonDecode(uriResponse.body);
  Map data = res['data']; //data รวม post_id ที่ส่งมา โดอยเรียงแล้ว มีตัวเลขนำ
  Map<int, BufferIDFeed> bufferIDFeed = {};
  data.forEach((key, value) {
    // print("${key} : ${value}");

    String post_id = value['post_id'];
    String type = value['type'];
    BufferIDFeed buffer = BufferIDFeed(post_id: post_id, type: type);

    bufferIDFeed[int.parse(key)] = buffer;
    // print("${key} ${id} ${type}");
  });
  GetPostFeedFooderResponseInit bufferGetPostFoodFooderResponseInit =
      GetPostFeedFooderResponseInit(bufferIDFeed: bufferIDFeed);
  // print("${bufferIDFeed}");

  return bufferGetPostFoodFooderResponseInit;
}
