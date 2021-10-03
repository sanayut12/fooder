import 'package:flutter/cupertino.dart';

class ChangeHowPayRequest {
  String bill_id, how_pay;
  ChangeHowPayRequest({@required this.bill_id, @required this.how_pay});
  Map<String, dynamic> value() {
    return {"bill_id": this.bill_id, "how_pay": this.how_pay};
  }
}

class ChangeHowPayResponse {
  String code;
  ChangeHowPayResponse({@required this.code});
}
