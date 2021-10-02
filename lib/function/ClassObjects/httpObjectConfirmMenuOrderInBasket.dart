import 'package:flutter/cupertino.dart';

class ConfirmItemsInBasketRequest {
  String user_id, post_id, address_user_id, comment, how_send, how_pay, mode;

  ConfirmItemsInBasketRequest(
      {@required this.user_id,
      @required this.post_id,
      @required this.address_user_id,
      @required this.comment,
      @required this.how_send,
      @required this.how_pay,
      @required this.mode});

  Map<String, dynamic> value() {
    return {
      "user_id": this.user_id,
      "post_id": this.post_id,
      "address_user_id": this.address_user_id,
      "comment": this.comment,
      "how_send": this.how_send,
      "how_pay": this.how_pay,
      "mode": this.mode
    };
  }
}

class ConfirmItemsInBasketResponse {
  final String bill_id;
  final List<String> bufferInventoryOver;
  final String
      code; // 20200 สำเร็จ , 40400 เกิดข้อผิดพลาด , 20400 มีbill ที่ไม่สามารถยืนยันได้เพราะกินจำนวนที่ตั้งไว้ ,20500 หมดเวลาการซื้อ
  ConfirmItemsInBasketResponse(
      {@required this.bill_id,
      @required this.bufferInventoryOver,
      @required this.code});
}
