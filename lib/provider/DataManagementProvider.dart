import 'package:flutter/foundation.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_ListPost_id.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/storageFunction.dart';
import 'package:fooder/function/http/httpGetItemInBasket_Items.dart';
import 'package:fooder/function/http/httpGetItemInBasket_ListPost_id.dart';

class DataManagementProvider with ChangeNotifier {
  //////ส่วนของจัดการภาษา////////
  String language = "th";
  String LanguageValue() {
    return language;
  }

  void ChangeLanguage(String _language) async {
    language = _language;
    InsertDataToStorage(key: "FOODERLANGUAGE", buffer: '${_language}');
    notifyListeners();
  }

  ///////ส่วนของตะกล้า//////////
  Map<String, GetItemInBasket_ItemsResponse> basket = {};

  Map<String, GetItemInBasket_ItemsResponse> BasketValue() {
    return basket;
  }

  int NumberInBasket() {
    // print("rrrrrrrrrrrr");
    int number = 0;

    basket.forEach((key1, value1) {
      value1.bufferItem.forEach((key2, value2) {
        number += value2.quantity;
      });
    });

    return number;
  }

  void UpdateBasket() async {
    String user_id = UserInfoManagement().User_id();
    // print(user_id);
    GetItemInBasket_ListPost_idRequest
        bufferGetItemInBasket_ListPost_idRequest =
        GetItemInBasket_ListPost_idRequest(user_id: user_id);
    GetItemInBasket_ListPost_idResponse
        bufferGetItemInBasket_ListPost_idResponse =
        await HttpGetItemInBasketListPostid(
            bufferGetItemInBasket_ListPost_idRequest:
                bufferGetItemInBasket_ListPost_idRequest);
    Map<String, GetItemInBasket_ItemsResponse> _basket = {};
    for (String post_id
        in bufferGetItemInBasket_ListPost_idResponse.bufferPost_id) {
      // print('kkk : ' + post_id);
      GetItemInBasket_ItemsRequest bufferGetItemInBasket_ItemsRequest =
          GetItemInBasket_ItemsRequest(user_id: user_id, post_id: post_id);
      GetItemInBasket_ItemsResponse bufferGetItemInBasket_ItemsResponse =
          await HttpGetItemInBasketItems(
              bufferGetItemInBasket_ItemsRequest:
                  bufferGetItemInBasket_ItemsRequest);

      _basket[post_id] = bufferGetItemInBasket_ItemsResponse;
    }
    basket = _basket;
    notifyListeners();
  }
}
