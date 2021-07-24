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

  String ToString() {
    return """
     ${this.inventory_id}
     ${this.menu_id} 
     ${this.name}  
     ${this.type}
     """;
  }
}

class DataPost {
  final String post_id, shop_id, detail;
  final int sendCost;
  final DateBox start, stop, send;
  final Map<int, DataMenu> bufferMenu;

  DataPost(
      {@required this.post_id,
      @required this.shop_id,
      @required this.detail,
      @required this.sendCost,
      @required this.start,
      @required this.stop,
      @required this.send,
      this.bufferMenu});
}
