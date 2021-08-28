import 'package:flutter/cupertino.dart';

class GetPathImageMenuRequest {
  final String inventory_id;
  GetPathImageMenuRequest({@required this.inventory_id});

  Map<String, dynamic> value() {
    return {"inventory_id": this.inventory_id};
  }
}

class GetPathImageMenuResponse {
  final List<PathImageMenu> listPathImageMenu;
  final String code;
  GetPathImageMenuResponse(
      {@required this.listPathImageMenu, @required this.code});
}

class PathImageMenu {
  final String image_menu_id, menu_id, path;
  PathImageMenu(
      {@required this.image_menu_id,
      @required this.menu_id,
      @required this.path});
}
