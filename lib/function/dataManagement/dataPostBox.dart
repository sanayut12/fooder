import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class DataMenu {
  final String inventory_id, menu_id, name, type, path, status;
  final int quantity, cost;
  DataMenu(
      {@required this.inventory_id,
      @required this.menu_id,
      @required this.name,
      @required this.type,
      @required this.path,
      @required this.status,
      @required this.quantity,
      @required this.cost});
}

class DataPost {
  final String post_id, shop_id, detail;
  final int sendCost;
  final DateBox start, stop, send;
  final Map<int, DataMenu> bufferMenu;

  DataPost(
      {this.post_id,
      this.shop_id,
      this.detail,
      this.sendCost,
      this.start,
      this.stop,
      this.send,
      this.bufferMenu});
}
