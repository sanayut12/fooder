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
  Map<String, GetBillFooderDataResponse> bufferdata = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetBill();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("==================billscreen2 dispost =============");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfffa897b), Colors.white])),
      child: ListView.builder(
          itemCount: bufferdata.length,
          itemBuilder: (BuildContext context, int index) {
            String bill_id = bufferdata.keys.toList()[index];
            return Bill2_BillBoxComponent(data: bufferdata[bill_id]);
          }),
    );
  }

  Future<void> GetBill() async {
    String user_id = UserInfoManagement().User_id();
    GetBillFooderInitRequest bufferGetBillFooderInitRequest =
        GetBillFooderInitRequest(user_id: user_id);
    // GetBillFooderInitResponse bufferGetBillFooderInitResponse =
    GetBillFooderInitResponse bufferGetBillFooderInitResponse =
        await HttpGetBillFooderInit(bufferGetBillFooderInitRequest);

    for (String bill_id in bufferGetBillFooderInitResponse.bufferBill_id) {
      GetBillFooderDataRequest bufferGetBillFooderDataRequest =
          GetBillFooderDataRequest(bill_id: bill_id);
      GetBillFooderDataResponse data =
          await HttpGetBillFooderData(bufferGetBillFooderDataRequest);

      setState(() {
        bufferdata[bill_id] = data;
      });
    }
  }
}
