import 'package:flutter/cupertino.dart';

class GetBillFooderInitRequest {
  final String user_id;
  GetBillFooderInitRequest({@required this.user_id});
  Map<String, dynamic> value() {
    return {"user_id": this.user_id};
  }
}

class GetBillFooderInitResponse {
  final List<String> bufferBill_id;
  final String code;
  GetBillFooderInitResponse(
      {@required this.bufferBill_id, @required this.code});
}
