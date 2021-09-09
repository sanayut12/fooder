import 'dart:convert';
import 'dart:typed_data';

import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderInit.dart';
import 'package:fooder/function/ClassObjects/httpObjectPayment.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<GetBillFooderInitResponse> HttpGetBillFooderInit(
    GetBillFooderInitRequest bufferGetBillFooderInitRequest) async {
  var body = bufferGetBillFooderInitRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/billFooder/getBillFooderInit");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);
  List list_bill_id = res['data']['list_bill_id'];
  String code = res['code'];
  List<String> bufferBill_id = [];

  list_bill_id.forEach((element) {
    bufferBill_id.add(element);
  });

  // print(bufferBill_id);
  return GetBillFooderInitResponse(bufferBill_id: bufferBill_id, code: code);
}
