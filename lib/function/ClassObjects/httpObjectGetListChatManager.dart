import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';

class GetListChatManagerRequest {
  String user_id;
  GetListChatManagerRequest({@required this.user_id});
  Map<String, String> value() {
    return {"user_id": this.user_id};
  }
}

class GetListChatManagerResponse {
  List<String> bufferChatManager_id;
  Map<String, ChatManager> bufferChatManager;
  Map<String, ShopProfileMini> bufferShopProfileMini;
  String code;
  GetListChatManagerResponse(
      {@required this.bufferChatManager_id,
      @required this.bufferChatManager,
      @required this.bufferShopProfileMini,
      @required this.code});
}
