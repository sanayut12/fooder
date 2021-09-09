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
  final BillFooder_Bill bill;
  final BillFooder_Payment payment;
  final BillFooder_ShopInfo shop_info;
  final BillFooder_PostInfo post_info;
  final Map<String, BillFooder_Inventory> bufferInventory;
  final Map<String, BillFooder_Menu> bufferMenu;
  final Map<String, BillFooder_Items> bufferItems;
  final String code;

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
  final String bill_id, address_user_id, how_send, how_pay, pay_status, status;
  final DateBox date;
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
  final String payment_id, bill_id, ref, status;
  final int cost;
  BillFooder_Payment(
      {@required this.payment_id,
      @required this.bill_id,
      @required this.ref,
      @required this.cost,
      @required this.status});
}

class BillFooder_ShopInfo {
  final String shop_id, name, image;
  BillFooder_ShopInfo(
      {@required this.shop_id, @required this.name, @required this.image});
}

class BillFooder_PostInfo {
  final String post_id, shop_id;
  final int sendCost;
  final DateBox start, stop, send;
  BillFooder_PostInfo(
      {@required this.post_id,
      @required this.shop_id,
      @required this.sendCost,
      @required this.start,
      @required this.stop,
      @required this.send});
}

class BillFooder_Inventory {
  final String post_id, menu_id;
  final int cost;
  BillFooder_Inventory(
      {@required this.post_id, @required this.menu_id, @required this.cost});
}

class BillFooder_Menu {
  final String name, path;
  BillFooder_Menu({@required this.name, @required this.path});
}

class BillFooder_Items {
  final String bill_id, inventory_id, comment, status;
  final int quantity;
  BillFooder_Items(
      {@required this.bill_id,
      @required this.inventory_id,
      @required this.quantity,
      @required this.comment,
      @required this.status});
}
