import 'dart:convert';
import 'package:fooder/function/ClassObjects/httpObjectGetAllAddress.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataAddressBox.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostFeedFooderPostShopResponse> HttpGetPostFeedFooderPostShop(
    GetPostFeedFooderPostShopRequest
        bufferGetPostFeedFooderPostShopRequest) async {
  var body = bufferGetPostFeedFooderPostShopRequest.value();

  var url = Uri.parse(HostName() + "/post/getPostFeedFooderPost_shop");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);

  //ข้อมูลที่ ยังไม้ได้อแลง
  Map shop_info = res['data']['shop_info'];
  Map post_info = res['data']['post_info'];
  List inventory_list = res['data']['inventory_list'];
  Map menu_list = res['data']['menu_list'];
  var code = res['code'];
  ;
  //ข้อมูลร้านค้า ที่จัดเข้า class
  DataAddressBox addressBox = DataAddressBox(
      address: shop_info['address'],
      no: shop_info['no'],
      moo: shop_info['moo'],
      baan: shop_info['baan'],
      road: shop_info['road'],
      soy: shop_info['soy'],
      sub_district: shop_info['sub_district'],
      district: shop_info['district'],
      province: shop_info['province']);
  DataShopInfo_PostBox dataShopInfo_PostBox = DataShopInfo_PostBox(
      post_id: bufferGetPostFeedFooderPostShopRequest.post_id,
      shop_id: shop_info['shop_id'],
      name: shop_info['name'],
      image: shop_info['image'],
      type: shop_info['type'],
      addressBox: addressBox,
      latitude: shop_info['latitude'].toDouble(),
      longtitude: shop_info['longtitude'].toDouble());

  //ข้อมูล โพสต์ที่จัดเข้า class

  DateBox date_start = DateBox(
      year: post_info['start']['year'],
      month: post_info['start']['month'],
      day: post_info['start']['day'],
      hour: post_info['start']['hour'],
      min: post_info['start']['min'],
      sec: post_info['start']['sec']);
  DateBox date_stop = DateBox(
      year: post_info['stop']['year'],
      month: post_info['stop']['month'],
      day: post_info['stop']['day'],
      hour: post_info['stop']['hour'],
      min: post_info['stop']['min']);
  DateBox date_send = DateBox(
      year: post_info['send']['year'],
      month: post_info['send']['month'],
      day: post_info['send']['day'],
      hour: post_info['send']['hour'],
      min: post_info['send']['min']);
  DataPost_PostBox dataPost_PostBox = DataPost_PostBox(
      post_id: post_info['post_id'],
      shop_id: post_info['shop_id'],
      detail: post_info['detail'],
      sendCost: post_info['sendCost'],
      start: date_start,
      stop: date_stop,
      send: date_send,
      how_send: post_info['how_send'],
      confirm_order: post_info['confirm_order'],
      over_order: post_info['over_order']);
  //จัดข้อมูล สตอกสิน้ค้า
  Map<String, DataInventory_PostBox> bufferDataInventory_PostBox = {};
  inventory_list.forEach((element) {
    bufferDataInventory_PostBox[element['inventory_id']] =
        DataInventory_PostBox(
            menu_id: element['menu_id'],
            quantity: element['quantity'],
            cost: element['cost']);
  });

  //จัดข้อมูลเมนู
  // <menu_id , data>
  Map<String, DataMenu_PostBox> bufferDataMenu_PostBox = {};
  menu_list.forEach((key, value) {
    bufferDataMenu_PostBox[key] = DataMenu_PostBox(
        name: value['name'],
        detail: value['detail'],
        type: value['type'],
        path: value['path']);
  });

  return GetPostFeedFooderPostShopResponse(
      dataShopInfo_PostBox: dataShopInfo_PostBox,
      dataPost_PostBox: dataPost_PostBox,
      bufferDataInventory_PostBox: bufferDataInventory_PostBox,
      bufferDataMenu_PostBox: bufferDataMenu_PostBox);
}
