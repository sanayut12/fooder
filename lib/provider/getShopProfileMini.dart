import 'package:fooder/function/ClassObjects/httpObjectGetShopProfileMini.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/http/httpGetShopProfileMini.dart';

Future<ShopProfileMini> GetShopProfileMini(String shop_id) async {
  String host = HostName();
  GetShopProfileMiniRequest bufferGetShopProfileMiniRequest =
      GetShopProfileMiniRequest(shop_id: shop_id);
  GetShopProfileMiniResponse bufferGetShopProfileMiniResponse =
      await HttpGetShopProfileMini(
          host: host,
          bufferGetShopProfileMiniRequest: bufferGetShopProfileMiniRequest);

  return bufferGetShopProfileMiniResponse.shop_profile;
}
