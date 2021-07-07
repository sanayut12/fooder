import 'dart:convert';

import 'package:fooder/function/ClassObjects/httpObjectGetOrderBasketFooder.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataOrderMenu.dart';
import 'package:fooder/function/dataManagement/readjson.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetOrderBasketFooderResponse> HttpGetOrderBasketFooder(
    GetOrderBasketFooderRequest bufferGetOrderBasketFooder) async {
  var body = bufferGetOrderBasketFooder.value();
  // print("$body");
  var url = Uri.parse(HostName() + "/foodbuy/getOrderBasketFooder");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  String code = res['code'];

  Map basketlist = res['basket'];
  Map<String, MenuCard> bufferMenuCard = {};
  // แยก ตระกล้า เมนูอาหาร
  basketlist.forEach((key, value) {
    //    ส่วนของการนำเมนูอาอาหารไปวนลูปแล้วเก็บใน ลิสส์
    Map menulist = value['menu'];
    Map<String, Menu> bufferMenu = {};
    menulist.forEach((key2, value2) {
      Menu menu = Menu(
          inventory_id: value2['inventory_id'],
          menu_id: value2['menu_id'],
          menu_name: value2['menu_name'],
          menu_image: value2['menu_image'],
          quantity: value2['quantity'],
          cost: value2['cost'],
          comment: value2['comment']);
      bufferMenu[key2] = menu;
    });
    //ส่วนของการดึงขอมูลของ ร้านค้าไปเก็บไว้ใน คลาสตัวแปร
    Map shop_info = value['shop_info'];
    ShopInfo shopInfo = ShopInfo(
        shop_id: shop_info['shop_id'],
        shop_name: shop_info['shop_name'],
        shop_image: shop_info['shop_image']);

    int cost = value['cost']; //ค่าส่อาหาร

    MenuCard menuCard =
        MenuCard(bufferMenu: bufferMenu, shopInfo: shopInfo, cost: cost);

    bufferMenuCard[key] = menuCard;
  });

  // print("จำนวน item ${bufferMenuCard.length}");
  Basket basket = Basket(bufferMenuCard: bufferMenuCard);
  GetOrderBasketFooderResponse bufferGetOrderBasketFooderResponse =
      GetOrderBasketFooderResponse(basket: basket, code: code);
  return bufferGetOrderBasketFooderResponse;
}
