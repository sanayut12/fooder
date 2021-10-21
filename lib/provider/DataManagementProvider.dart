import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_ListPost_id.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/storageFunction.dart';
import 'package:fooder/function/http/httpGetItemInBasket_Items.dart';
import 'package:fooder/function/http/httpGetItemInBasket_ListPost_id.dart';
import 'package:fooder/module/socketioManagerForgound.dart';
import 'package:fooder/provider/getShopProfileMini.dart';
import 'package:fooder/provider/type5.dart';

class DataManagementProvider with ChangeNotifier {
  void initSocket() async {
    String user_id = UserInfoManagement().User_id();
    print("init state provider ${user_id}");
    SocketioManagerForgound().subscript("fooder:${user_id}", RecieveSocket);
  }

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

  //ข้อมูลร้านค้า
  Map<String, ShopProfileMini> bufferShopInfoMini = {};

  ///ส่วนของแชต
  List<String> ChatRead = [];
  List<String> ChatSort = []; //ลิสส์ที่เก็บรายการ รหัสห้องแชต chatmanager_id
  Map<String, ChatManager> bufferChatmanager = {}; //< chatmanager_id, data>
  Map<String, ChatBox> bufferChatBox = {}; //<chatmessage_id . data>

  void RecieveSocket(String message) async {
    Map dataJson = json.decode(message);
    print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu${dataJson}");
    String type = dataJson['type'];
    if (type == "5") {
      Type5 dataType5 = Type5(dataJson: dataJson);

      ///เช็คว่ามีข้อมูล ของ shop ไหม
      String shop_id = dataType5.ToShop_id();

      if (!bufferShopInfoMini.containsKey(shop_id)) {
        // print("ไม่มี shop นี้ ${shop_id}");
        ShopProfileMini shopProfileMini = await GetShopProfileMini(shop_id);
        bufferShopInfoMini[shop_id] = shopProfileMini;
      }
      String chatmanager_id = dataType5.Tochatmanager_id();
      String chatmessage_id = dataType5.Tochatmessage_id();

      ChatManager chatManager = dataType5.ToChatManager();
      ChatBox chatBox = await dataType5.ToChatBox();
      print(chatBox.message);

      if (!bufferChatmanager.containsKey(chatmanager_id)) {
        bufferChatmanager[chatmanager_id] = chatManager;
      }
      bufferChatBox[chatmessage_id] = chatBox;
      ChatSort.remove(chatmanager_id);
      ChatSort.insert(0, chatmanager_id);
      // ChatSort
      notifyListeners();
    }
  }

  void AddShopProfileMini(
      String shop_id, ShopProfileMini shopProfileMini) async {
    bool check = bufferShopInfoMini.containsKey(shop_id);
    if (!check) {
      bufferShopInfoMini[shop_id] = shopProfileMini;
      notifyListeners();
    }
  }

  void AddChatmanager(String chatmanager_id, ChatManager chatManager) async {
    bool check = bufferChatmanager.containsKey(chatmanager_id);
    if (!check) {
      bufferChatmanager[chatmanager_id] = chatManager;
      notifyListeners();
    }
  }

  void AddChatSort(String chatmanager_id) async {
    bool check = ChatSort.contains(chatmanager_id);
    if (!check) {
      ChatSort.add(chatmanager_id);
      notifyListeners();
    }
  }

  void AddUsers(String user_id, ShopProfileMini shopProfileMini) {
    bufferShopInfoMini[user_id] = shopProfileMini;
    notifyListeners();
  }

  void AddChatBox(String chatmessage_id, ChatBox chatBox) {
    bufferChatBox[chatmessage_id] = chatBox;
    notifyListeners();
  }
}
