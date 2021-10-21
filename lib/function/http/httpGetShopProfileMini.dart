import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetShopProfileMini.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<GetShopProfileMiniResponse> HttpGetShopProfileMini(
    {@required
        String host,
    @required
        GetShopProfileMiniRequest bufferGetShopProfileMiniRequest}) async {
  var body = bufferGetShopProfileMiniRequest.value();
  // print("$body");
  var url = Uri.parse("${host}/shop/getShopProfileMini");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);

  String code = res['code'];
  Map _shop_info = res['shop_info'];
  String name = _shop_info['name'];
  String image = _shop_info['image'];
  ShopProfileMini shop_profile = ShopProfileMini(name: name, image: image);
  return GetShopProfileMiniResponse(shop_profile: shop_profile, code: code);
}
