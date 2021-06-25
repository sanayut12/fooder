import 'dart:convert';
import 'package:fooder/ClassObjects/httpObjectGetPostFeedFooder.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:fooder/function/dataManagement/readjson.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

void initHttpGetPostFeedFooder() async {
  hostname = await json.decode(await readJson())['http'];
}

//r
Future<GetPostFoodFooderResponse> HttpGetPostFeedFooder(
    GetPostFoodFooderRequest bufferGetPostFoodFooderRequest) async {
  var body = bufferGetPostFoodFooderRequest.value();
  // print("$body");
  var url = Uri.parse(hostname + "/post/getPostFeedFooder");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  Map shop_info = res['shop_info'];
  Map post_shop = res['post_info'];
  // print("$shop_info $post_shop");
  Map<String, DataShopInfo> bufferDataShopInfo = {};
  Map<String, DataPost> bufferDataPost = {};
  shop_info.forEach((key, value) {
    DataShopInfo dataShopInfo = DataShopInfo(
        name: value['name'],
        image: value['image'],
        latitude: value['latitude'],
        longtitude: value['longtitude']);
    bufferDataShopInfo[key] = dataShopInfo;
    // print(value);
  });
  // print("$post_shop");
  post_shop.forEach((key, value) {
    Map<int, DataMenu> bufferMenu = {};
    Map menu_list = value['menu'];
    menu_list.forEach((keyMenu, valueMenu) {
      int level = int.parse(keyMenu);

      DataMenu dataMenu = DataMenu(
          inventory_id: valueMenu['inventory_id'],
          menu_id: valueMenu['menu_id'],
          name: valueMenu['name'],
          type: valueMenu['type'],
          path: valueMenu['path'],
          status: valueMenu['status'],
          quantity: valueMenu['quantity'],
          cost: valueMenu['cost']);
      bufferMenu[level] = dataMenu;

      // print(keyMenu);
      // print(valueMenu);
    });

    // print("ffffffffffffffffffffffffffffffffffff");

    DataPost dataPost = DataPost(
        post_id: key,
        shop_id: value['shop_id'],
        detail: value['detail'],
        sendCost: value['sendCost'],
        start: DateBox(
            year: value['start']['year'],
            month: value['start']['month'],
            day: value['start']['date'],
            hour: value['start']['hour'],
            min: value['start']['min']),
        stop: DateBox(
            year: value['stop']['year'],
            month: value['stop']['month'],
            day: value['stop']['date'],
            hour: value['stop']['hour'],
            min: value['stop']['min']),
        send: DateBox(
            year: value['send']['year'],
            month: value['send']['month'],
            day: value['send']['date'],
            hour: value['send']['hour'],
            min: value['send']['min']),
        bufferMenu: bufferMenu);
    bufferDataPost[key] = dataPost;
    // print(key);
  });
  GetPostFoodFooderResponse bufferGetPostFoodFooderResponse =
      GetPostFoodFooderResponse(
          bufferDataShopInfo: bufferDataShopInfo,
          bufferDataPost: bufferDataPost);

  return bufferGetPostFoodFooderResponse;
}
