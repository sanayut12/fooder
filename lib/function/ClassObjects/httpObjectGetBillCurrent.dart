import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class GetBillCurrentRequest {
  final String user_id;
  GetBillCurrentRequest({@required this.user_id});

  Map<String, dynamic> value() {
    return {"user_id": this.user_id};
  }
}

class GetBillCurrentResponse {
  final List<Bill> bufferBill;
  final Map<String, ShopInfoBill> bufferShopInfoBill; //<shop_id ,data>
  final Map<String, ItemBill> bufferItemBill; //<item_id ,data>
  final Map<String, MenuList> bufferMenuList; //<inventory_id , data>
  final String code;
  GetBillCurrentResponse(
      {@required this.bufferBill,
      @required this.bufferShopInfoBill,
      @required this.bufferItemBill,
      @required this.bufferMenuList,
      @required this.code});
}

class Bill {
  final String bill_id, address_user_id, post_id, shop_id, send;
  final int sendCost;
  final DateBox date, dateSend;
  Bill(
      {@required this.bill_id,
      @required this.address_user_id,
      @required this.post_id,
      @required this.shop_id,
      @required this.dateSend,
      @required this.sendCost,
      @required this.send,
      @required this.date});
}

class ShopInfoBill {
  final String name, image, type, address, sub_district, district, province;
  final double latitude, longtitude;
  ShopInfoBill(
      {@required this.name,
      @required this.image,
      @required this.type,
      @required this.address,
      @required this.sub_district,
      @required this.district,
      @required this.province,
      @required this.latitude,
      @required this.longtitude});
}

class ItemBill {
  final String bill_id, inventory_id, comment;
  final int quantity;
  ItemBill(
      {@required this.bill_id,
      @required this.inventory_id,
      @required this.quantity,
      @required this.comment});
}

class MenuList {
  final String post_id, menu_id, name, type, path;
  final int cost;
  MenuList(
      {@required this.name,
      @required this.post_id,
      @required this.menu_id,
      @required this.type,
      @required this.cost,
      @required this.path});
}
