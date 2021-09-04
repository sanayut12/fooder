import 'dart:convert';
import 'dart:typed_data';

import 'package:fooder/function/ClassObjects/httpObjectPayment.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<PaymentResponse> HttpPayment(PaymentRequest bufferPaymentRequest) async {
  var body = bufferPaymentRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/payment/paymentBill");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  // print(res);
  String ref = res['data']['ref'];
  int cost = res['data']['cost'];
  String promptpay = res['data']['promptpay'];
  String _image = res['data']['image'];
  String code = res['code'];

  Uint8List image = base64Decode(_image);

  return PaymentResponse(
      ref: ref, image: image, cost: cost, promptpay: promptpay, code: code);
}
