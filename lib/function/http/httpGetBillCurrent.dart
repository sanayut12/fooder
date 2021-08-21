import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAllAddress.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
// import 'package:fooder/function/dataManagement/dataOrderMenu.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<GetBillCurrentResponse> HttpGetBillCurrent(
    GetBillCurrentRequest bufferGetBillCurrentRequest) async {
  var body = bufferGetBillCurrentRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/user/getBillCurrent");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);

  //  ส่วนของข้อมูลที่แปลงไว้แล้ว
  List<Bill> bufferBill = [];
  Map<String, ItemBill> bufferItemBill =
      {}; //<item_id , data<ข้อมูลของสินค้าที่เราสั่งในบิล>>
  Map<String, MenuList> bufferMenuList =
      {}; // <inventory_id , data<ข้อมูลเมนูสินค้า ยึดข้อมูลจากคลังสินค้า>>
  Map<String, ShopInfoBill> bufferShopInfoBill =
      {}; //<shop_id , data<ข้อมูลของร้านค้า>>

  String code = res['code'];
  Map bill = res['data']['bill'];
  Map item = res['data']['item'];
  Map menu = res['data']['menu'];
  Map shop_info = res['data']['shop_info'];

  //วนลูปเพื่อเซตข้อมูลบิลใส่ตัวแปร
  bill.forEach((key, value) {
    Map date = value['date'];
    Map dateSend = value['dateSend'];
    Bill _bill = Bill(
        bill_id: key,
        address_user_id: value['address_user_id'],
        post_id: value['post_id'],
        shop_id: value['shop_id'],
        sendCost: value['sendCost'],
        send: value['send'],
        dateSend: DateBox(
            year: dateSend['year'],
            month: dateSend['month'],
            day: dateSend['day'],
            hour: dateSend['hour'],
            min: dateSend['min']),
        date: DateBox(
            year: date['year'],
            month: date['month'],
            day: date['day'],
            hour: date['hour'],
            min: date['min']));

    bufferBill.add(_bill);
  });

  //วนลูปเพื่อเอาของใส่ item ซึ่งเป็น รายการของ bill  //<item_id , data<>>
  item.forEach((key, value) {
    ItemBill _item = ItemBill(
        bill_id: value['bill_id'],
        inventory_id: value['inventory_id'],
        quantity: value['quantity'],
        comment: value['comment']);
    bufferItemBill[key] = _item;
  });

  menu.forEach((key, value) {
    MenuList _menu = MenuList(
        name: value['name'],
        post_id: value['post_id'],
        menu_id: value['menu_id'],
        type: value['type'],
        cost: value['cost'],
        path: value['path']);
    bufferMenuList[key] = _menu;
  });

  shop_info.forEach((key, value) {
    ShopInfoBill _bufferShopInfoBill = ShopInfoBill(
        name: value['name'],
        image: value['image'],
        type: value['type'],
        address: value['address'],
        sub_district: value['sub_district'],
        district: value['district'],
        province: value['province'],
        latitude: value['latitude'],
        longtitude: value['longtitude']);
    bufferShopInfoBill[key] = _bufferShopInfoBill;
  });
  GetBillCurrentResponse bufferGetBillCurrentResponse = GetBillCurrentResponse(
      bufferBill: bufferBill,
      bufferShopInfoBill: bufferShopInfoBill,
      bufferItemBill: bufferItemBill,
      bufferMenuList: bufferMenuList,
      code: code);
  return bufferGetBillCurrentResponse;
}
