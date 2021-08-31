import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAddressUser.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_ListPost_id.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetItemInBasket_ListPost_idResponse> HttpGetItemInBasketListPostid(
    {@required
        GetItemInBasket_ListPost_idRequest
            bufferGetItemInBasket_ListPost_idRequest}) async {
  var body = bufferGetItemInBasket_ListPost_idRequest.value();

  var url = Uri.parse("${HostName()}/basketfooder/getItemInBasket_ListPost_id");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);

  //ส่วนของข้อมูลังไม่ได้แปลง
  List list_post_id = res['data']['list_post_id'];
  String code = res['code'];

  List<String> bufferPost_id = [];
  list_post_id.forEach((element) {
    bufferPost_id.add(element);
  });
  GetItemInBasket_ListPost_idResponse
      bufferGetItemInBasket_ListPost_idResponse =
      GetItemInBasket_ListPost_idResponse(
          bufferPost_id: bufferPost_id, code: code);

  return bufferGetItemInBasket_ListPost_idResponse;
}
