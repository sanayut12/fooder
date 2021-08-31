import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_ListPost_id.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetItemInBasket_ItemsResponse> HttpGetItemInBasketItems(
    {@required
        GetItemInBasket_ItemsRequest
            bufferGetItemInBasket_ItemsRequest}) async {
  var body = bufferGetItemInBasket_ItemsRequest.value();

  var url = Uri.parse("${HostName()}/basketfooder/getItemInBasket_Items");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  // print(res);
  //ส่วนของข้อมูลังไม่ได้แปลง
  Map _shop_info = res['data']['shop_info'];
  Map _post_info = res['data']['post_info'];
  List item_list = res['data']['item_list'];
  Map inventory_list = res['data']['inventory_list'];
  Map menu_list = res['data']['menu_list'];
  String code = res['code'];

  //ข้อมูลร้านค้า บางส่วน
  BasketBox_shopInfo shop_info = BasketBox_shopInfo(
      shop_id: _shop_info['shop_id'],
      name: _shop_info['name'],
      image: _shop_info['image']);
  //ข้อมูลโพสต์บางส่วน
  Map stop = _post_info['stop'];
  DateBox date_stop = DateBox(
      year: stop['year'],
      month: stop['month'],
      day: stop['day'],
      hour: stop['hour'],
      min: stop['min']);
  BasketBox_PostInfo post_info = BasketBox_PostInfo(
      post_id: _post_info['post_id'],
      sendCost: _post_info['sendCost'],
      stop: date_stop,
      how_send: _post_info['how_send']);
//ข้อมูลสินค้าที่ซื้อ
  List<BasketBox_Item> bufferItem = [];
  item_list.forEach((element) {
    bufferItem.add(BasketBox_Item(
        item_id: element['item_id'],
        inventory_id: element['inventory_id'],
        quantity: element['quantity'],
        comment: element['comment']));
  });

  //ข้อมูลสตอกสินค้า
  Map<String, BasketBox_Inventory> bufferInventory = {};
  inventory_list.forEach((key, value) {
    bufferInventory[key] = BasketBox_Inventory(
        post_id: value['post_id'],
        menu_id: value['menu_id'],
        quantity: value['quantity'],
        cost: value['cost']);
  });

  //ข้อมูลเมนู
  Map<String, BasketBox_Menu> bufferMenu = {};
  menu_list.forEach((key, value) {
    bufferMenu[key] = BasketBox_Menu(
        shop_id: value['shop_id'],
        name: value['name'],
        detail: value['detail'],
        type: value['type'],
        path: value['path']);
  });

  return GetItemInBasket_ItemsResponse(
      shop_info: shop_info,
      post_info: post_info,
      bufferItem: bufferItem,
      bufferInventory: bufferInventory,
      bufferMenu: bufferMenu,
      code: code);
}
