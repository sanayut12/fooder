import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/notificationUsers/httpObjectNotificationBill.dart';

class GetNotificationUserInitRequest {
  String user_id;
  GetNotificationUserInitRequest({@required this.user_id});
  Map<String, dynamic> value() {
    return {"user_id": this.user_id};
  }
}

class GetNotificationUserInitResponse {
  List<NotificationUserInit> list_notification = [];
  String code;
  GetNotificationUserInitResponse(
      {@required this.list_notification, @required this.code});
}

class NotificationUserInit {
  String notification_id, type;
  NotificationUserInit({@required this.notification_id, @required this.type});
}

class NotificationBasket {
  String type;
  NotificationBillResponse notification_bill;
  NotificationBasket({@required this.type, this.notification_bill});
}
