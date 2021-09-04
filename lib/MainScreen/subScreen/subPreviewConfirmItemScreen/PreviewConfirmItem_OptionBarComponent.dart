import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectConfirmMenuOrderInBasket.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpConfirmMenuOrderInBasket.dart';

class PreviewConfirmItem_OptionBarComponent extends StatefulWidget {
  final String how_send;
  final String address_user_id;
  final String how_pay;
  final int active;
  final GetItemInBasket_ItemsResponse data;
  PreviewConfirmItem_OptionBarComponent(
      {@required this.how_send,
      @required this.address_user_id,
      @required this.how_pay,
      @required this.active,
      @required this.data});
  @override
  _PreviewConfirmItem_OptionBarComponentState createState() =>
      _PreviewConfirmItem_OptionBarComponentState();
}

class _PreviewConfirmItem_OptionBarComponentState
    extends State<PreviewConfirmItem_OptionBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonModel(String text, Function func, int act) => GestureDetector(
          onTap: () {
            if (act == 1) {
              func();
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: act == 1 ? Colors.red : Colors.white),
            child: Text("${text}"),
          ),
        );
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      color: Colors.pink,
      child: Row(
        children: [
          Expanded(child: ButtonModel("กลับ", Back, 1)),
          Expanded(
              child: ButtonModel(
                  "ยืนยันคำสั่งซื้อ", ConfirmBill, this.widget.active))
        ],
      ),
    );
  }

  Future<void> Back() {
    Navigator.of(context).pop();
  }

  Future<void> ConfirmBill() async {
    String user_id = UserInfoManagement().User_id();
    ConfirmItemsInBasketRequest bufferConfirmItemsInBasketRequest =
        ConfirmItemsInBasketRequest(
            user_id: user_id,
            post_id: this.widget.data.post_info.post_id,
            address_user_id: this.widget.address_user_id,
            how_send: this.widget.how_send,
            how_pay: this.widget.how_pay);
    ConfirmItemsInBasketResponse bufferConfirmItemsInBasketResponse =
        await HttpConfirmItemsInBasket(bufferConfirmItemsInBasketRequest);
    print(bufferConfirmItemsInBasketResponse);

    if (bufferConfirmItemsInBasketResponse.code == "20200") {
      PreviewConfirmItem_return data_pop = PreviewConfirmItem_return(
          bill_id: bufferConfirmItemsInBasketResponse.bill_id,
          how_pay: this.widget.how_pay);
      Navigator.of(context).pop(data_pop);
    } else if (bufferConfirmItemsInBasketResponse.code == "20400") {
      //ของไม่พอ
    } else if (bufferConfirmItemsInBasketResponse.code == "20500") {
      //หมดเวลาการซื้อ
    } else if (bufferConfirmItemsInBasketResponse.code == "40400") {
      //เกิดข้อผิดพลาด
    } else {
      //server ไม่ตอบ
    }
  }
}

class PreviewConfirmItem_return {
  final String how_pay;
  final String bill_id;
  PreviewConfirmItem_return({@required this.bill_id, @required this.how_pay});
}
