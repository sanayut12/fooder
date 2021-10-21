import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';

class GetShopProfileMiniRequest {
  String shop_id;
  GetShopProfileMiniRequest({@required this.shop_id});
  Map<String, String> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetShopProfileMiniResponse {
  ShopProfileMini shop_profile;
  String code;
  GetShopProfileMiniResponse(
      {@required this.shop_profile, @required this.code});
}
