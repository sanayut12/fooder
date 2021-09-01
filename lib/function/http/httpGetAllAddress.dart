import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAllAddress.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataAddressUser.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<GetAllAddressResponse> HttpGetAllAddress(
    GetAllAddressRequest bufferGetAllAddressRequest) async {
  var body = bufferGetAllAddressRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/users/getAllAddress");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);
  String code = res['code'];
  List list_address = res['data']['list_address'];

  Map<String, DataAddressUser> bufferDataAddressUser = {};
  list_address.forEach((element) {
    bufferDataAddressUser[element['address_user_id']] = DataAddressUser(
        user_id: element['user_id'],
        name: element['name'],
        phone: element['phone'],
        address: element['address'],
        no: element['no'],
        moo: element['moo'],
        baan: element['baan'],
        road: element['road'],
        soy: element['soy'],
        sub_district: element['sub_district'],
        district: element['district'],
        province: element['province'],
        latitude: element['latitude'].toDouble(),
        longtitude: element['longtitude'].toDouble());
  });

  return GetAllAddressResponse(
      bufferDataAddressUser: bufferDataAddressUser, code: code);
}
