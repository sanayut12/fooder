import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAllAddress.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
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

  print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);
  String code = res['code'];
  Map data = res['data'];
  Map<int, AddressBox> bufferAddressBox = {};
  data.forEach((key, value) {
    // print("$value");
    AddressBox addressBox = AddressBox(
        address_user_id: value['address_user_id'],
        phone: value['phone'],
        address: value['address'],
        sub_district: value['sub_district'],
        district: value['district'],
        province: value['province'],
        latitude: value['latitude'],
        longtitude: value['longtitude']);
    bufferAddressBox[int.parse(key)] = addressBox;
  });

  GetAllAddressResponse bufferAddAddressResponse =
      GetAllAddressResponse(bufferAddressBox: bufferAddressBox, code: code);
  return bufferAddAddressResponse;
}
