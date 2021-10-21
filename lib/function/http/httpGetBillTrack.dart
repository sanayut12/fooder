import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillTrack.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetBillTrackResponse> HttpGetBillTrack(
    {@required GetBillTrackRequest bufferGetBillTrackRequest}) async {
  var body = bufferGetBillTrackRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/track/getBillTrack");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  String code = res['code'];

  Map _post = res['data']['post'];
  Map _menu = res['data']['item'];
  GetBillTrack_Post post =
      GetBillTrack_Post(post_id: _post['post_id'], detail: _post['detail']);
  Map<String, GetBillTrack_Item> bufferMenu = {};
  _menu.forEach((key, value) {
    bufferMenu[key] =
        GetBillTrack_Item(name: value['name'], quantity: value['quantity']);
  });
  return GetBillTrackResponse(
      bill_id: bufferGetBillTrackRequest.bill_id,
      post: post,
      bufferMenu: bufferMenu,
      code: code);
}
