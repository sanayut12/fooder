import 'dart:convert';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderInit.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostFoodFooderPostShopResponse> HttpGetPostFeedFooderPostShop(
    GetPostFoodFooderPostShopRequest
        bufferGetPostFoodFooderPostShopRequest) async {
  var body = bufferGetPostFoodFooderPostShopRequest.value();

  var url = Uri.parse(HostName() + "/post/getPostFeedFooderPost_shop");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  Map shop_info = res['shop_info'];
  Map post_info = res['post_info'];
  var code = res['code'];

  Map menu = post_info['menu'];
  // print("${menu}");
  // DataMenu bufferDataMenu = DataMenu(inventory_id: inventory_id, menu_id: menu_id, name: name, type: type, path: path, status: status, quantity: quantity, cost: cost)

  Map<String, DataShopInfo> bufferDataShopInfo = {};
  Map<String, DataPost> bufferDataPost = {};

  DataShopInfo dataShopInfo = DataShopInfo(
      name: shop_info['name'],
      image: shop_info['image'],
      latitude: shop_info['latitude'],
      longtitude: shop_info['longtitude']);

  //แยกเวลาออกมาใส่ตัวแปร
  Map start = post_info['start'];
  Map stop = post_info['stop'];
  Map send = post_info['send'];

  //จัดเวลาใส่คลาส
  DateBox date_start = DateBox(
      year: start['year'],
      month: start['month'],
      day: start['day'],
      hour: start['hour'],
      min: start['min']);

  DateBox date_stop = DateBox(
      year: stop['year'],
      month: stop['month'],
      day: stop['day'],
      hour: stop['hour'],
      min: stop['min']);

  DateBox date_send = DateBox(
      year: send['year'],
      month: send['month'],
      day: send['day'],
      hour: send['hour'],
      min: send['min']);
  //จัดข้อมูลเมนูในโพสต์
  Map<int, DataMenu> bufferMenu = {};
  menu.forEach((key, value) {
    // print("${key}");
    DataMenu dataMenu = DataMenu(
        inventory_id: value['inventory_id'],
        menu_id: value['menu_id'],
        name: value['name'],
        type: value['type'],
        path: value['path'],
        status: value['status'],
        quantity: value['quantity'],
        cost: value['cost']);
    bufferMenu[int.parse(key)] = dataMenu;
    // print("${value}");
  });
  // print("${bufferMenu}}");
  //จัดขอมูลใส่โพสต์
  DataPost dataPost = DataPost(
      post_id: post_info['post_id'],
      shop_id: post_info['shop_id'],
      detail: post_info['detail'],
      sendCost: post_info['sendCost'],
      start: date_start,
      stop: date_stop,
      send: date_send,
      bufferMenu: bufferMenu);

  bufferDataShopInfo[shop_info['shop_id']] = dataShopInfo;
  bufferDataPost[post_info['post_id']] = dataPost;
  // print("${date_start.ToString()}");
  GetPostFoodFooderPostShopResponse bufferGetPostFoodFooderPostShopResponse =
      GetPostFoodFooderPostShopResponse(
          bufferDataShopInfo: bufferDataShopInfo,
          bufferDataPost: bufferDataPost);
  // bufferGetPostFoodFooderPostShopResponse.bufferDataShopInfo
  //     .forEach((key, value) {
  //   print(value);
  // });
  return bufferGetPostFoodFooderPostShopResponse;
}



// //   // print(res);
// //   Map shop_info = res['shop_info'];
// //   Map post_shop = res['post_info'];
// //   // print("$shop_info $post_shop");
// //   Map<String, DataShopInfo> bufferDataShopInfo = {};
// //   Map<String, DataPost> bufferDataPost = {};
// //   shop_info.forEach((key, value) {
// //     DataShopInfo dataShopInfo = DataShopInfo(
// //         name: value['name'],
// //         image: value['image'],
// //         latitude: value['latitude'],
// //         longtitude: value['longtitude']);
// //     bufferDataShopInfo[key] = dataShopInfo;
// //     // print(value);
// //   });
// //   // print("$post_shop");
// //   post_shop.forEach((key, value) {
// //     Map<int, DataMenu> bufferMenu = {};
// //     Map menu_list = value['menu'];
// //     menu_list.forEach((keyMenu, valueMenu) {
// //       int level = int.parse(keyMenu);

// //       DataMenu dataMenu = DataMenu(
// //           inventory_id: valueMenu['inventory_id'],
// //           menu_id: valueMenu['menu_id'],
// //           name: valueMenu['name'],
// //           type: valueMenu['type'],
// //           path: valueMenu['path'],
// //           status: valueMenu['status'],
// //           quantity: valueMenu['quantity'],
// //           cost: valueMenu['cost']);
// //       bufferMenu[level] = dataMenu;

// //       // print(keyMenu);
// //       // print(valueMenu);
// //     });

// //     // print("ffffffffffffffffffffffffffffffffffff");

// //     DataPost dataPost = DataPost(
// //         post_id: key,
// //         shop_id: value['shop_id'],
// //         detail: value['detail'],
// //         sendCost: value['sendCost'],
// //         start: DateBox(
// //             year: value['start']['year'],
// //             month: value['start']['month'],
// //             day: value['start']['date'],
// //             hour: value['start']['hour'],
// //             min: value['start']['min']),
// //         stop: DateBox(
// //             year: value['stop']['year'],
// //             month: value['stop']['month'],
// //             day: value['stop']['date'],
// //             hour: value['stop']['hour'],
// //             min: value['stop']['min']),
// //         send: DateBox(
// //             year: value['send']['year'],
// //             month: value['send']['month'],
// //             day: value['send']['date'],
// //             hour: value['send']['hour'],
// //             min: value['send']['min']),
// //         bufferMenu: bufferMenu);
// //     bufferDataPost[key] = dataPost;
// //     // print(key);
// //   });