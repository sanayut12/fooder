import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class GetBillFooderDataRequest {
  final String bill_id;
  GetBillFooderDataRequest({@required this.bill_id});
  Map<String, dynamic> value() {
    return {"bill_id": this.bill_id};
  }
}

class GetBillFooderDataResponse {
  BillFooder_Bill bill;
  BillFooder_Payment payment;
  BillFooder_ShopInfo shop_info;
  BillFooder_PostInfo post_info;
  Map<String, BillFooder_Inventory> bufferInventory;
  Map<String, BillFooder_Menu> bufferMenu;
  Map<String, BillFooder_Items> bufferItems;
  String code;

  GetBillFooderDataResponse(
      {@required this.bill,
      @required this.payment,
      @required this.shop_info,
      @required this.post_info,
      @required this.bufferInventory,
      @required this.bufferMenu,
      @required this.bufferItems,
      @required this.code});
}

class BillFooder_Bill {
  String bill_id, address_user_id, how_send, how_pay, pay_status, status;
  DateBox date;
  BillFooder_Bill(
      {@required this.bill_id,
      @required this.address_user_id,
      @required this.date,
      @required this.how_send,
      @required this.how_pay,
      @required this.pay_status,
      @required this.status});
}

class BillFooder_Payment {
  String payment_id, bill_id, ref, status;
  int cost;
  BillFooder_Payment(
      {@required this.payment_id,
      @required this.bill_id,
      @required this.ref,
      @required this.cost,
      @required this.status});
}

class BillFooder_ShopInfo {
  String shop_id, name, image;
  BillFooder_ShopInfo(
      {@required this.shop_id, @required this.name, @required this.image});
}

class BillFooder_PostInfo {
  String post_id, shop_id;
  int sendCost;
  DateBox start, stop, send;
  BillFooder_PostInfo(
      {@required this.post_id,
      @required this.shop_id,
      @required this.sendCost,
      @required this.start,
      @required this.stop,
      @required this.send});
}

class BillFooder_Inventory {
  String post_id, menu_id;
  int cost;
  BillFooder_Inventory(
      {@required this.post_id, @required this.menu_id, @required this.cost});
}

class BillFooder_Menu {
  String name, path;
  BillFooder_Menu({@required this.name, @required this.path});
}

class BillFooder_Items {
  String bill_id, inventory_id, comment, status;
  int quantity;
  BillFooder_Items(
      {@required this.bill_id,
      @required this.inventory_id,
      @required this.quantity,
      @required this.comment,
      @required this.status});
}
