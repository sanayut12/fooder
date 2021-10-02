import 'package:flutter/cupertino.dart';

class NotificationBillRequest {
  String notification_id;
  NotificationBillRequest({@required this.notification_id});
  Map<String, dynamic> value() {
    return {"notification_id": this.notification_id};
  }
}

class NotificationBillResponse {
  NotificationUser notification;
  NotificationPostShop post_shop;
  NotificationShop shop;
  String code;
  NotificationBillResponse(
      {@required this.notification,
      @required this.post_shop,
      @required this.shop,
      @required this.code});
}

class NotificationUser {
  String step;
  String bill_id;
  String click;
  NotificationUser(
      {@required this.step, @required this.click, @required this.bill_id});
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
