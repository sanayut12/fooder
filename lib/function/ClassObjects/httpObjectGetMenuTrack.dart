import 'package:flutter/cupertino.dart';

class GetMenuTrackRequest {
  String inventory_id;
  GetMenuTrackRequest({@required this.inventory_id});
  Map<String, String> value() {
    return {"inventory_id": this.inventory_id};
  }
}

class GetMenuTrackResponse {
  GetMenuTrack_Inventory inventory;
  GetMenuTrack_Menu menu;
  String code;
  GetMenuTrackResponse(
      {@required this.inventory, @required this.menu, @required this.code});
}

class GetMenuTrack_Inventory {
  String post_id;
  String inventory_id;
  int quantity, cost;
  GetMenuTrack_Inventory(
      {@required this.post_id,
      @required this.inventory_id,
      @required this.quantity,
      @required this.cost});
}

class GetMenuTrack_Menu {
  String name, image;
  GetMenuTrack_Menu({@required this.name, @required this.image});
}
