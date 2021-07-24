import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/basket/BasketCardMenuComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/confirmOrderScreen/ConfirmOrderScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectConfirmMenuOrderInBasket.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataOrderMenu.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpConfirmMenuOrderInBasket.dart';

class BasketCardComponent extends StatefulWidget {
  final Function deletePostID;
  final String post_id;
  final MenuCard menuCard;
  BasketCardComponent(
      {@required this.post_id,
      @required this.menuCard,
      @required this.deletePostID});

  @override
  _BasketCardComponentState createState() => _BasketCardComponentState();
}

class _BasketCardComponentState extends State<BasketCardComponent> {
  // ShopInfo menuCard = this.widget.menuCart.shopInfo;
  @override
  Widget build(BuildContext context) {
    Widget ShopInfoComponent = Container(
      height: 50,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${HostName()}/image/ImageProfileShop/" +
                            this.widget.menuCard.shopInfo.shop_image))),
          ),
          Text("${this.widget.menuCard.shopInfo.shop_name}"),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Text("ซื้อสินค้าเพิ่ม"),
              ),
            ),
          ))
        ],
      ),
    );

//ปุ่มไว้ยืนยัน order ของ post นั้นๆ
    Widget ConfirmOrderButton = Expanded(
        child: GestureDetector(
      onTap: () {
        GoToConfirmOrderScreen();
      },
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Text("ยืนยันการซื้อ"),
      ),
    ));

//ปุ่มไว้ลบ order ทั้งหมดของ โพสต์ๆ นั้น
    Widget DeleteOrderButton = Expanded(
        child: Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Text("ลบสินค้าทั้งหมด"),
    ));
//บาร์ ออปชั่น ของการจัดการ ออเดอร์  ซื้อหรือ ยกเลิก
    Widget OrderButtonBar = Container(
      height: 50,
      child: Row(
        children: [ConfirmOrderButton, DeleteOrderButton],
      ),
    );
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      // height: 100,
      child: Column(
        children: [
          ShopInfoComponent,
          BasketCardMenuComponent(
            bufferMenu: this.widget.menuCard.bufferMenu,
          ),
          OrderButtonBar
        ],
      ),
    );
  }

  // Future httpConfirmMenuOrderInBasket() async {
  //   String user_id = UserInfoManagement().User_id();
  //   ConfirmMenuOrderInBasketRequest bufferConfirmMenuOrderInBasketRequest =
  //       ConfirmMenuOrderInBasketRequest(
  //           user_id: user_id, post_id: this.widget.post_id);
  //   HttpConfirmMenuOrderInBasket(bufferConfirmMenuOrderInBasketRequest);
  // }

  Future GoToConfirmOrderScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ConfirmOrderScreen(
              post_id: this.widget.post_id,
              menuCard: this.widget.menuCard,
              deletePostID: this.widget.deletePostID,
            )));
  }
}
