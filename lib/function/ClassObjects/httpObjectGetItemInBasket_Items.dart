import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class GetItemInBasket_ItemsRequest {
  String user_id, post_id;
  GetItemInBasket_ItemsRequest(
      {@required this.user_id, @required this.post_id});
  Map<String, dynamic> value() {
    return {'user_id': this.user_id, 'post_id': this.post_id};
  }
}

class GetItemInBasket_ItemsResponse {
  BasketBox_shopInfo shop_info;
  BasketBox_PostInfo post_info;
  Map<String, BasketBox_Item> bufferItem; //<item_id,data>
  Map<String, BasketBox_Inventory> bufferInventory; //<inventory_id ,data>
  Map<String, BasketBox_Menu> bufferMenu; //<menu_id ,data>

  String code;
  GetItemInBasket_ItemsResponse(
      {@required this.shop_info,
      @required this.post_info,
      @required this.bufferItem,
      @required this.bufferInventory,
      @required this.bufferMenu,
      @required this.code});
}

class BasketBox_shopInfo {
  String shop_id, name, image;
  BasketBox_shopInfo(
      {@required this.shop_id, @required this.name, @required this.image});
}

class BasketBox_PostInfo {
  String post_id, how_send;
  int sendCost;
  DateBox stop;
  BasketBox_PostInfo(
      {@required this.post_id,
      @required this.sendCost,
      @required this.stop,
      @required this.how_send});
}

class BasketBox_Item {
  String inventory_id;
  int quantity;
  BasketBox_Item({@required this.inventory_id, @required this.quantity});
}

class BasketBox_Inventory {
  String post_id, menu_id;
  int quantity, cost;
  BasketBox_Inventory(
      {@required this.post_id,
      @required this.menu_id,
      @required this.quantity,
      @required this.cost});
}

class BasketBox_Menu {
  String shop_id, name, detail, type, path;
  BasketBox_Menu(
      {@required this.shop_id,
      @required this.name,
      @required this.detail,
      @required this.type,
      @required this.path});
}
