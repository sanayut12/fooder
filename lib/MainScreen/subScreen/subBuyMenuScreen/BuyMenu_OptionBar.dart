import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_OptionUser.dart';
import 'package:fooder/function/ClassObjects/httpObjectAddItemtoBasket.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpAddItemToBasket.dart';

class BuyMenu_OptionBar extends StatefulWidget {
  int active;
  final DataMenu_PostBox dataMenu;
  final DataInventory_PostBox dataInventory;
  BuyMenu_OptionBar(
      {@required this.active,
      @required this.dataInventory,
      @required this.dataMenu});
  @override
  _BuyMenu_OptionBarState createState() => _BuyMenu_OptionBarState();
}

class _BuyMenu_OptionBarState extends State<BuyMenu_OptionBar> {
  // int active = 1;
  String comment = "";
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Widget OptionsBar_Cancel = this.widget.active == 0
        ? Container()
        : GestureDetector(
            onTap: () {
              // print("${quantity} ${comment}");
              setState(() {
                this.widget.active = 0;
              });
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.5),
              // child: Text("${quantity} ${comment}"),
              // alignment: Alignment.center,
            ),
          );

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: OptionsBar_Cancel),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: this.widget.active == 0
                ? 0
                : MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: this.widget.active == 0
                ? Container()
                : BuyMenu_OptionUser(
                    quantity: quantity,
                    comment: comment,
                    SetQuantity: SetQuantity,
                    SetComment: SetComment,
                    CallAddBaseket: CallAddBaseket,
                    CallBuyNow: CallBuyNow,
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> CallAddBaseket() async {
    print("1");
    httpAddMenuTobasket();
  }

  Future<void> CallBuyNow() async {
    print("2");
  }

  Future<void> SetQuantity(int i) {
    int value = quantity + i;
    setState(() {
      if (value <= 0) {
        quantity = 1;
      } else {
        quantity = value;
      }
    });
  }

  Future<void> SetComment(String _comment) {
    setState(() {
      comment = _comment;
    });
  }

  Future httpAddMenuTobasket() async {
    String user_id = await UserInfoManagement().User_id();
    String inventory_id = this.widget.dataInventory.inventory_id;
    AddItemTobasketRequest bufferAddItemTobasketRequest =
        AddItemTobasketRequest(
            user_id: user_id,
            inventory_id: inventory_id,
            quantity: quantity,
            comment: comment);
    AddItemToBasketResponse bufferAddItemToBasketResponse =
        await HttpAddMenuToBasket(bufferAddItemTobasketRequest);
    print(bufferAddItemToBasketResponse.code);
    if (bufferAddItemToBasketResponse.code == "20200") {
      AlertMenu();
    }
  }

  Future AlertMenu() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "คุณได้เพิ่มเมนู ${this.widget.dataMenu.name} ลงตะกล้าสำเร็จ"),
            actions: [
              GestureDetector(
                onTap: () async {
                  await Navigator.of(context).pop();
                  await Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("ตกลง"),
                ),
              )
            ],
          );
        });
  }
}
