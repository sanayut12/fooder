import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPathImageMenu.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;
// import 'package:shopder/function/dataManagement/Readhostname.dart';
// import 'package:shopder/function/dataManagement/dateBox.dart';
// import 'package:shopder/function/http/ClassObjects/httpObjectGetPathImageMenu.dart';
// import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPathImageMenuResponse> httpGetPathImageMenu(
    {@required GetPathImageMenuRequest bufferGetPathImageMenuRequest}) async {
  var body = bufferGetPathImageMenuRequest.value();

  var url = Uri.parse("${HostName()}/menu/getPathImageMenu");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);

  String code = res['code'];
  //ส่วนของข้อมูลที่ยังไม่ได้แปลง
  List data_path = res['data']['data_path'];
  // print(res);

  // ส่วนของข้อมูลที่ทำการแปลงแล้ว
  List<PathImageMenu> listPathImageMenu = [];
  data_path.forEach((element) {
    listPathImageMenu.add(PathImageMenu(
        image_menu_id: element['image_menu_id'],
        menu_id: element['menu_id'],
        path: element['path']));
  });

  return GetPathImageMenuResponse(
      listPathImageMenu: listPathImageMenu, code: code);
}
