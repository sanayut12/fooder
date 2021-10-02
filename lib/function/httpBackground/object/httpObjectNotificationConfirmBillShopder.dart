import 'package:flutter/cupertino.dart';

class NotificationConfirmBillShopderRequest {
  String notification_id;
  NotificationConfirmBillShopderRequest({@required this.notification_id});
  Map<String, dynamic> value() {
    return {'notification_id': this.notification_id};
  }
}

class NotificationConfirmBillShopderResponse {
  NotificationUser notification;
  NotificationPostShop post_shop;
  NotificationShop shop;
  String code;
  NotificationConfirmBillShopderResponse(
      {@required this.notification,
      @required this.post_shop,
      @required this.shop,
      @required this.code});
}

class NotificationUser {
  String step;
  String bill_id;
  NotificationUser({@required this.step, @required this.bill_id});
}

class NotificationPostShop {
  String post_id, detail;
  NotificationPostShop({@required this.post_id, @required this.detail});
}

class NotificationShop {
  String shop_id, name, image;
  NotificationShop(
      {@required this.shop_id, @required this.name, @required this.image});
}
