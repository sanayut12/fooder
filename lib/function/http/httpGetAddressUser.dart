import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAddressUser.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetAddressUserResponse> HttpGetAddressUser(
    {@required GetAddressUserRequest bufferGetAddressUserRequest}) async {
  var body = bufferGetAddressUserRequest.value();

  var url = Uri.parse("${HostName()}/user/getAddressUser");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);

  //ส่วนของข้อมูลังไม่ได้แปลง
  Map address = res['data']['address'];
  String code = res['code'];

  GetAddressUserResponse getAddressUserResponse = GetAddressUserResponse(
      address_user_id: address['address_user_id'],
      user_id: address['user_id'],
      phone: address['phone'],
      address: address['address'],
      sub_district: address['sub_district'],
      district: address['district'],
      province: address['province'],
      latitude: address['latitude'],
      longtitude: address['longtitude']);
  return getAddressUserResponse;
}
