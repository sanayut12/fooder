import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostTrack.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostTrackResponse> HttpGetPostTrack(
    {@required GetPostTrackRequest bufferGetPostTrackRequest}) async {
  var body = bufferGetPostTrackRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/track/getPostTrack");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  String code = res['code'];

  Map _post_info = res['data']['post_info'];
  List menu = res['data']['menu'];

  GetPostTrack_post post_info = GetPostTrack_post(
      post_id: _post_info['post_id'], detail: _post_info['detail']);
  List<String> bufferMenu = [];
  menu.forEach((element) {
    bufferMenu.add(element);
  });
  return GetPostTrackResponse(
      post_info: post_info, bufferMenu: bufferMenu, code: code);
}
