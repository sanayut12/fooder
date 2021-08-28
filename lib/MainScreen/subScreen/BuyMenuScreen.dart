import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_DetailComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_ListImage.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_NameMenuComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBuyMenuScreen/BuyMenu_Status1Component.dart';
import 'package:fooder/function/ClassObjects/httpObjectAddMenutoBasket.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpAddMenuToBasket.dart';

class BuyMenuScreen extends StatefulWidget {
  final DataMenu_PostBox dataMenu;
  final DataInventory_PostBox dataInventory;
  BuyMenuScreen({@required this.dataInventory, @required this.dataMenu});
  @override
  _BuyMenuScreenState createState() => _BuyMenuScreenState();
}

class _BuyMenuScreenState extends State<BuyMenuScreen> {
  int quantity = 1;
  String comment = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("${this.widget.dataMenu.inventory_id}");
  }

  @override
  Widget build(BuildContext context) {
    // Widget FoodDetail = Container(
    //   height: double.infinity,
    //   width: double.infinity,
    //   child: Row(
    //     children: [
    //       Expanded(
    //           child: Container(
    //         alignment: Alignment.center,
    //         child: Text(
    //           "จำนวนคงเหลือ ${this.widget.dataMenu.quantity}",
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
    //         ),
    //       )),
    //       Expanded(
    //           child: Container(
    //         alignment: Alignment.center,
    //         child: Text(
    //           "ราคา ${this.widget.dataMenu.cost} บาท",
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
    //         ),
    //       ))
    //     ],
    //   ),
    //   // color: Colors.red,
    // );

    // //ส่วนของการ เพิ่มลบ จำนวนอาหารก่อนจะกดสั่งซื้อ
    // Widget Add_number_button = GestureDetector(
    //   onTap: () {
    //     NumberItem(1);
    //   },
    //   child: Container(
    //     height: 50,
    //     width: 50,
    //     decoration: BoxDecoration(
    //         color: Colors.red, borderRadius: BorderRadius.circular(50)),
    //     child: Icon(
    //       Icons.plus_one,
    //       size: 30,
    //     ),
    //   ),
    // );
    // Widget Minus_number_button = GestureDetector(
    //   onTap: () {
    //     NumberItem(-1);
    //   },
    //   child: Container(
    //     height: 50,
    //     width: 50,
    //     decoration: BoxDecoration(
    //         color: Colors.red, borderRadius: BorderRadius.circular(50)),
    //     child: Icon(
    //       Icons.exposure_minus_1,
    //       size: 30,
    //     ),
    //   ),
    // );

    // Widget FoodConsoleMenuOption = Container(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Minus_number_button,
    //       Container(
    //         margin: EdgeInsets.only(left: 20, right: 20),
    //         child: Text(
    //           "$quantity",
    //           style: TextStyle(fontSize: 30),
    //         ),
    //       ),
    //       Add_number_button
    //     ],
    //   ),
    // );

    // //ส่วนของปุ่มกดยื่นยันหรือยกเลิกการสั่งสินค้า
    // Widget FoodConsoleButton = Container(
    //   child: Row(
    //     children: [
    //       Expanded(
    //           child: GestureDetector(
    //         onTap: () {
    //           CancelMenu();
    //         },
    //         child: Container(
    //           margin: EdgeInsets.all(20),
    //           decoration: BoxDecoration(
    //               color: Colors.red, borderRadius: BorderRadius.circular(30)),
    //           alignment: Alignment.center,
    //           child: Text("ยกเลิก"),
    //         ),
    //       )),
    //       Expanded(
    //           child: GestureDetector(
    //         onTap: () {
    //           AddbasketMenu();
    //         },
    //         child: Container(
    //           margin: EdgeInsets.all(20),
    //           decoration: BoxDecoration(
    //               color: Colors.red, borderRadius: BorderRadius.circular(30)),
    //           alignment: Alignment.center,
    //           child: Text("เพิ่มลงตะกล้า"),
    //         ),
    //       )),
    //       Expanded(
    //           child: GestureDetector(
    //         onTap: () {
    //           BuyNowMenu();
    //         },
    //         child: Container(
    //           margin: EdgeInsets.all(20),
    //           decoration: BoxDecoration(
    //               color: Colors.red, borderRadius: BorderRadius.circular(30)),
    //           alignment: Alignment.center,
    //           child: Text("ซื้อเลย"),
    //         ),
    //       ))
    //     ],
    //   ),
    // );
    // Widget CommentMenu = Container(
    //   padding: EdgeInsets.only(left: 10, right: 10),
    //   child: TextFormField(
    //     onChanged: (e) {
    //       setState(() {
    //         comment = e;
    //       });
    //     },
    //     decoration: InputDecoration(
    //         hintText: "บอกรายละเอียดเพิ่มเติมในสินค้า",
    //         fillColor: Colors.white,
    //         filled: true),
    //     maxLines: 3,
    //   ),
    // );
    // Widget FoodConsole = Container(
    //   child: Column(
    //     children: [
    //       Expanded(child: FoodConsoleMenuOption),
    //       Expanded(child: CommentMenu),
    //       Expanded(child: FoodConsoleButton)
    //     ],
    //   ),
    // );

    return Scaffold(
      // appBar: AppBar(),
      // resizeToAvoidBottomInset: false,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.green,
          child: ListView(
            children: [
              BuyMenu_ListImageComponent(
                dataInventory: this.widget.dataInventory,
                dataMenu: this.widget.dataMenu,
              ),
              BuyMenu_NameMenuComponent(dataMenu: this.widget.dataMenu),
              BuyMenu_Status1Component(
                  dataInventory: this.widget.dataInventory),
              BuyMenu_DetailComponent(dataMenu: this.widget.dataMenu),
            ],
          )),
    );
  }

  Future NumberItem(int number) {
    if (quantity <= 1 && number == -1) {
    } else {
      setState(() {
        quantity += number;
      });
    }
  }

  Future CancelMenu() {
    Navigator.of(context).pop();
  }

  // Future AddbasketMenu() {
  //   httpAddMenuTobasket();
  // }

  Future BuyNowMenu() {}

  // Future httpAddMenuTobasket() async {
  //   String user_id = await UserInfoManagement().User_id();
  //   String inventory_id = this.widget.dataMenu.inventory_id;
  //   AddMenuTobasketRequest bufferAddMenuTobasketRequest =
  //       AddMenuTobasketRequest(
  //           user_id: user_id,
  //           inventory_id: inventory_id,
  //           quantity: quantity,
  //           comment: comment);
  //   AddMenuToBasketResponse bufferAddMenuToBasketResponse =
  //       await HttpAddMenuToBasket(bufferAddMenuTobasketRequest);
  //   print(bufferAddMenuToBasketResponse.code);
  //   if (bufferAddMenuToBasketResponse.code == "20200") {
  //     AlertMenu();
  //   }
  // }

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
