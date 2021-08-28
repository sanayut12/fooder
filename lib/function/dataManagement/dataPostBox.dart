import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataAddressBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class DataShopInfo_PostBox {
  final String shop_id, name, image, type;
  final DataAddressBox addressBox;
  final double latitude, longtitude;

  DataShopInfo_PostBox(
      {@required this.shop_id,
      @required this.name,
      @required this.image,
      @required this.type,
      @required this.addressBox,
      @required this.latitude,
      @required this.longtitude});
}

class DataPost_PostBox {
  final String post_id, shop_id, detail;
  final int sendCost;
  final DateBox start, stop, send;
  final String how_send, over_order, confirm_order;

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
  final String inventory_id, menu_id;
  final int quantity, cost;

  DataInventory_PostBox(
      {@required this.inventory_id,
      @required this.menu_id,
      @required this.quantity,
      @required this.cost});
}

class DataMenu_PostBox {
  final String name, detail, type, path;
  DataMenu_PostBox(
      {@required this.name,
      @required this.detail,
      @required this.type,
      @required this.path});
}
