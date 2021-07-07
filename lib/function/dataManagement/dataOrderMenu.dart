import 'package:flutter/cupertino.dart';

class Basket {
  final Map<String, MenuCard> bufferMenuCard;
  Basket({@required this.bufferMenuCard});

  int length() {
    return bufferMenuCard.length;
  }

  List<String> ListPostID() {
    var list_post_id = <String>[];
    bufferMenuCard.forEach((key, value) {
      list_post_id.add(key);
    });
    return list_post_id;
  }
}

class MenuCard {
  final Map<String, Menu> bufferMenu;
  final ShopInfo shopInfo;
  final int cost;
  MenuCard(
      {@required this.bufferMenu,
      @required this.shopInfo,
      @required this.cost});
}

class Menu {
  final String inventory_id, menu_id, menu_name, menu_image, comment;
  final int quantity, cost;
  Menu(
      {@required this.inventory_id,
      @required this.menu_id,
      @required this.menu_name,
      @required this.menu_image,
      @required this.quantity,
      @required this.cost,
      @required this.comment});
}

class ShopInfo {
  final String shop_id, shop_name, shop_image;
  ShopInfo(
      {@required this.shop_id,
      @required this.shop_name,
      @required this.shop_image});
}
