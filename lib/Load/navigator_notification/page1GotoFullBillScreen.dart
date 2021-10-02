import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/http/httpGetBillFooderData.dart';

Future<GetBillFooderDataResponse> Page1GotoFullBillScreen(
    String bill_id) async {
  GetBillFooderDataRequest bufferGetBillFooderDataRequest =
      GetBillFooderDataRequest(bill_id: bill_id);
  GetBillFooderDataResponse data =
      await HttpGetBillFooderData(bufferGetBillFooderDataRequest);
  return data;
}
