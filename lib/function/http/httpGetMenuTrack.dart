import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetMenuTrack.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostTrack.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetMenuTrackResponse> HttpGetMenuTrack(
    {@required GetMenuTrackRequest bufferGetMenuTrackRequest}) async {
  var body = bufferGetMenuTrackRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/track/getMenuTrack");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  String code = res['code'];
  Map _inventory = res['data']['inventory'];
  Map _menu = res['data']['menu'];

  GetMenuTrack_Inventory inventory = GetMenuTrack_Inventory(
      post_id: _inventory['post_id'],
      inventory_id: _inventory['inventory_id'],
      quantity: _inventory['quantity'],
      cost: _inventory['cost']);

  GetMenuTrack_Menu menu =
      GetMenuTrack_Menu(name: _menu['name'], image: _menu['path']);
  return GetMenuTrackResponse(inventory: inventory, menu: menu, code: code);
}
