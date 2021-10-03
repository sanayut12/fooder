import 'dart:convert';

import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderInit.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataAddressUser.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<GetBillFooderDataResponse> HttpGetBillFooderData(
    GetBillFooderDataRequest bufferGetBillFooderDataRequest) async {
  var body = bufferGetBillFooderDataRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/billFooder/getBillFooderData");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);
  Map _bill = res['data']['bill'];
  Map _payment = res['data']['payment'];
  Map _shopinfo = res['data']['shopinfo'];
  Map _postinfo = res['data']['postinfo'];
  Map _inventory = res['data']['inventory'];
  Map _menu = res['data']['menu'];
  Map _items = res['data']['items'];
  Map _address = res['data']['address_users'];
  // print(_bill);
  // print(_address);
  //ส่วนของบิล
  DateBox bill_date = DateBox(
      year: _bill['date']['year'],
      month: _bill['date']['month'],
      day: _bill['date']['day'],
      hour: _bill['date']['hour'],
      min: _bill['date']['min'],
      sec: _bill['date']['sec']);
  DateBox bill_date_confirm = null;
  Map json_bill_date_confirm = _bill['date_confirm'];
  print(json_bill_date_confirm);
  if (json_bill_date_confirm != null) {
    bill_date_confirm = DateBox(
        year: json_bill_date_confirm['year'],
        month: json_bill_date_confirm['month'],
        day: json_bill_date_confirm['day'],
        hour: json_bill_date_confirm['hour'],
        min: json_bill_date_confirm['min']);
  }
  BillFooder_Bill bill = BillFooder_Bill(
      bill_id: _bill['bill_id'],
      address_user_id: _bill['address_user_id'],
      date: bill_date,
      how_send: _bill['how_send'],
      how_pay: _bill['how_pay'],
      pay_status: _bill['pay_status'],
      date_confirm: bill_date_confirm,
      status: _bill['status']);
  //ส่วนของพร้อมเพย์
  BillFooder_Payment payment = BillFooder_Payment(
      payment_id: _payment['payment_id'],
      bill_id: _payment['bill_id'],
      ref: _payment['ref'],
      cost: _payment['cost'],
      status: _payment['status']);
  //่ส่วนของข้อมูลร้าน
  BillFooder_ShopInfo shop_info = BillFooder_ShopInfo(
      shop_id: _shopinfo['shop_id'],
      name: _shopinfo['name'],
      image: _shopinfo['image']);
  //ส่วนของโพสต์
  DateBox post_start = DateBox(
      year: _postinfo['start']['year'],
      month: _postinfo['start']['month'],
      day: _postinfo['start']['day'],
      hour: _postinfo['start']['hour'],
      min: _postinfo['start']['min'],
      sec: _postinfo['start']['sec']);
  DateBox post_stop = DateBox(
      year: _postinfo['stop']['year'],
      month: _postinfo['stop']['month'],
      day: _postinfo['stop']['day'],
      hour: _postinfo['stop']['hour'],
      min: _postinfo['stop']['min']);
  DateBox post_send = DateBox(
      year: _postinfo['send']['year'],
      month: _postinfo['send']['month'],
      day: _postinfo['send']['day'],
      hour: _postinfo['send']['hour'],
      min: _postinfo['send']['min']);
  BillFooder_PostInfo post_info = BillFooder_PostInfo(
      post_id: _postinfo['post_id'],
      shop_id: _postinfo['shop_id'],
      sendCost: _postinfo['sendCost'],
      start: post_start,
      stop: post_stop,
      send: post_send);

  //ส่วนของสตอกสินค้า
  Map<String, BillFooder_Inventory> bufferInventory = {};
  _inventory.forEach((key, value) {
    bufferInventory[key] = BillFooder_Inventory(
        post_id: value['post_id'],
        menu_id: value['menu_id'],
        cost: value['cost']);
    // print(value['cost']);
  });
  //ส่วนของรายการเมนู
  Map<String, BillFooder_Menu> bufferMenu = {};
  _menu.forEach((key, value) {
    bufferMenu[key] = BillFooder_Menu(name: value['name'], path: value['path']);
  });
  //ส่วนของรายการสั่งซื้อ
  Map<String, BillFooder_Items> bufferItems = {};
  _items.forEach((key, value) {
    bufferItems[key] = BillFooder_Items(
        bill_id: value['bill_id'],
        inventory_id: value['inventory_id'],
        quantity: value['quantity'],
        comment: value['comment'],
        status: value['status']);
  });

  Map<String, DataAddressUser> bufferAddress = {};
  if (_address != null) {
    bufferAddress[_address['address_user_id']] = DataAddressUser(
        user_id: _address['user_id'],
        name: _address['name'],
        phone: _address['phone'],
        address: _address['address'],
        no: _address['no'],
        moo: _address['moo'],
        baan: _address['baan'],
        road: _address['road'],
        soy: _address['soy'],
        sub_district: _address['sub_district'],
        district: _address['district'],
        province: _address['province'],
        latitude: _address['latitude'].toDouble(),
        longtitude: _address['longtitude'].toDouble());
  }
  String code = res['code'];
  return GetBillFooderDataResponse(
      bill: bill,
      payment: payment,
      shop_info: shop_info,
      post_info: post_info,
      bufferInventory: bufferInventory,
      bufferMenu: bufferMenu,
      bufferItems: bufferItems,
      bufferAddress: bufferAddress,
      code: code);
}
