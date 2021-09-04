import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class PaymentRequest {
  final String bill_id;
  PaymentRequest({@required this.bill_id});
  Map<String, dynamic> value() {
    return {"bill_id": this.bill_id};
  }
}

class PaymentResponse {
  final String ref, promptpay;
  final int cost;
  final Uint8List image;
  final String code;
  PaymentResponse(
      {@required this.ref,
      @required this.image,
      @required this.cost,
      @required this.promptpay,
      @required this.code});
}
