import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';

class ChatConnectRequest {
  String user_id, shop_id;
  ChatConnectRequest({@required this.user_id, @required this.shop_id});

  Map<String, dynamic> value() {
    return {"user_id": this.user_id, "shop_id": this.shop_id};
  }
}

class ChatConnectionResponse {
  String chatmanager_id, code;
  ChatManager chatManager;
  ShopProfileMini shopProfileMini;
  ChatConnectionResponse(
      {@required this.chatmanager_id,
      @required this.chatManager,
      @required this.shopProfileMini,
      @required this.code});
}
