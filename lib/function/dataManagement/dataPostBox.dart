import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataAddressBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class DataShopInfo_PostBox {
  String post_id, shop_id, name, image, type;
  DataAddressBox addressBox;
  double latitude, longtitude;

  DataShopInfo_PostBox(
      {@required this.post_id,
      @required this.shop_id,
      @required this.name,
      @required this.image,
      @required this.type,
      @required this.addressBox,
      @required this.latitude,
      @required this.longtitude});
}

class DataPost_PostBox {
  String post_id, shop_id, detail;
  int sendCost;
  DateBox start, stop, send;
  String how_send, over_order, confirm_order;

  DataPost_PostBox(
      {@required this.post_id,
      @required this.shop_id,
      @required this.detail,
      @required this.sendCost,
      @required this.start,
      @required this.stop,
      @required this.send,
      @required this.how_send,
      @required this.confirm_order,
      @required this.over_order});
}

class DataInventory_PostBox {
  String menu_id;
  int quantity, cost;

  DataInventory_PostBox(
      {@required this.menu_id, @required this.quantity, @required this.cost});
}

class DataMenu_PostBox {
  String name, detail, type, path;
  DataMenu_PostBox(
      {@required this.name,
      @required this.detail,
      @required this.type,
      @required this.path});
}
