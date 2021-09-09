import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen2/Bill2_BillBoxComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderInit.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetBillFooderData.dart';
import 'package:fooder/function/http/httpGetBillFooderInit.dart';

class BillScreen2 extends StatefulWidget {
  @override
  _BillScreen2State createState() => _BillScreen2State();
}

class _BillScreen2State extends State<BillScreen2> {
  Map<int, GetBillFooderDataResponse> bufferdata = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetBill_id();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: ListView.builder(
          itemCount: bufferdata.length,
          itemBuilder: (BuildContext context, int index) {
            return Bill2_BillBoxComponent(data: bufferdata[index]);
          }),
    );
  }

  Future<void> GetBill_id() async {
    String user_id = UserInfoManagement().User_id();
    GetBillFooderInitRequest bufferGetBillFooderInitRequest =
        GetBillFooderInitRequest(user_id: user_id);
    // GetBillFooderInitResponse bufferGetBillFooderInitResponse =
    GetBillFooderInitResponse bufferGetBillFooderInitResponse =
        await HttpGetBillFooderInit(bufferGetBillFooderInitRequest);
    int index = 0;
    Map<int, GetBillFooderDataResponse> _bufferdata = {};
    for (String key in bufferGetBillFooderInitResponse.bufferBill_id) {
      GetBillFooderDataRequest bufferGetBillFooderDataRequest =
          GetBillFooderDataRequest(bill_id: key);
      GetBillFooderDataResponse data =
          await HttpGetBillFooderData(bufferGetBillFooderDataRequest);
      _bufferdata[index] = data;
      index += 1;
      // print(index);
    }
    setState(() {
      bufferdata = _bufferdata;
    });
  }
}
