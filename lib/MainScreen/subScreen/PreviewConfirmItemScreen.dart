import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_AppbarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_ItemComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_MessageComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_OptionBarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_SelectAddressComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_SelectHowPayComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_SelectHowSendComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_ShopInfoComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_TimeStopComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPreviewConfirmItemScreen/PreviewConfirmItem_TotalCostContainer.dart';
import 'package:fooder/function/ClassObjects/httpObjectConfirmMenuOrderInBasket.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpConfirmMenuOrderInBasket.dart';

class PreviewConfirmItemScreen extends StatefulWidget {
  String mode;
  GetItemInBasket_ItemsResponse data;
  PreviewConfirmItemScreen({@required this.mode, @required this.data});
  @override
  _PreviewConfirmItemScreenState createState() =>
      _PreviewConfirmItemScreenState();
}

class _PreviewConfirmItemScreenState extends State<PreviewConfirmItemScreen> {
  String how_send;
  String address_user_id;
  String how_pay;
  String comment = "";
  int active = 0;

  bool check_load = false;
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffa897b), Colors.white])),
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    PreviewConfirmItem_AppbarComponent(),
                    Expanded(
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.9,
                        child: ListView(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin:
                                  EdgeInsets.only(top: 10, left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  PreviewConfirmItem_ShopInfoComponent(
                                      shop_info: this.widget.data.shop_info),
                                  Preview_ListMenu(
                                    data: this.widget.data,
                                    ChangeLoad: ChangeLoad,
                                  ),
                                  PreviewConfirmItem_TimeStopComponent(
                                      post_info: this.widget.data.post_info),
                                  // PreviewConfirmItem_RateServiceComponent(),
                                  PreviewConfirmItem_TotalCostContainer(
                                      data: this.widget.data),
                                ],
                              ),
                            ),
                            PreviewConfirmItem_SelectHowSendComponent(
                              how_send: how_send,
                              data: this.widget.data,
                              SetHowSend: SetHowSend,
                            ),
                            PreviewConfirmItem_SelectAddressComponent(
                              SetAddressSelect: SetAddressSelect,
                            ),
                            PreviewConfirmItem_SelectHowPayComponent(
                                how_pay: how_pay, SetHowPay: SetHowPay),
                            PreviewConfirmItem_MessageComponent(
                              comment: this.comment,
                              SetText: SetText,
                            ),
                            SizedBox(
                              height: 150,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: PreviewConfirmItem_OptionBarComponent(
                    fun: ConfirmBill,
                    active: active,
                  ),
                ),
                check_load
                    ? Expanded(
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Colors.grey.withOpacity(0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> SetHowSend(String _hs) {
    setState(() {
      how_send = _hs;
    });

    SetActive();
  }

  Future<void> SetAddressSelect(String _ac) {
    setState(() {
      address_user_id = _ac;
    });
    SetActive();
  }

  Future<void> SetHowPay(String hp) {
    setState(() {
      how_pay = hp;
    });
    SetActive();
  }

  Future<void> SetText(String _comment) {
    comment = _comment;
  }

  Future<void> ChangeLoad(bool _load) {
    setState(() {
      check_load = _load;
    });
  }

  Future<void> SetActive() {
    if (how_send != null && address_user_id != null && how_pay != null) {
      setState(() {
        active = 1;
      });
    } else {
      setState(() {
        active = 0;
      });
    }
  }

  Future<void> ConfirmBill() async {
    String user_id = UserInfoManagement().User_id();
    ConfirmItemsInBasketRequest bufferConfirmItemsInBasketRequest =
        ConfirmItemsInBasketRequest(
            user_id: user_id,
            post_id: this.widget.data.post_info.post_id,
            comment: this.comment,
            address_user_id: this.address_user_id,
            how_send: this.how_send,
            how_pay: this.how_pay,
            mode: this.widget.mode);
    ConfirmItemsInBasketResponse bufferConfirmItemsInBasketResponse =
        await HttpConfirmItemsInBasket(bufferConfirmItemsInBasketRequest);
    print(bufferConfirmItemsInBasketResponse);

    if (bufferConfirmItemsInBasketResponse.code == "20200") {
      PreviewConfirmItem_return data_pop = PreviewConfirmItem_return(
          bill_id: bufferConfirmItemsInBasketResponse.bill_id,
          how_pay: this.how_pay);
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

class Preview_ListMenu extends StatefulWidget {
  GetItemInBasket_ItemsResponse data;
  Function ChangeLoad;
  Preview_ListMenu({@required this.data, @required this.ChangeLoad});
  @override
  _Preview_ListMenuState createState() => _Preview_ListMenuState();
}

class _Preview_ListMenuState extends State<Preview_ListMenu> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    int len = this.widget.data.bufferItem.length;
    return Container(
      height: weight_screen * 0.18 * len,
      width: double.infinity,
      child: ListView.builder(
          itemCount: len,
          itemBuilder: (BuildContext context, int index) {
            String item_id = this.widget.data.bufferItem.keys.toList()[index];
            return PreviewConfirmItem_ItemComponent(
              item_id: item_id,
              data: this.widget.data,
              ChangeLoad: this.widget.ChangeLoad,
            );
          }),
    );
  }

  //  this.widget.data.bufferItem.forEach((element) {
  //   String item_id = element.item_id;

  //   ListItemsComponent.add(PreviewConfirmItem_ItemComponent(
  //       item_id: item_id, data: this.widget.data));
  // });
  // Widget ShowAllMenu = Container(
  //     height: weight_screen *
  //         0.18 *
  //         this.widget.data.bufferItem.length.toDouble(),
  //     width: double.infinity,
  //     child: Column(
  //       children: ListItemsComponent,
  //     ));
}
