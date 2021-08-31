// // import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fooder/MainScreen/subScreen/subBasketScreen/BasketCardMenuComponent.dart';
// import 'package:fooder/MainScreen/subScreen/subBasketScreen/confirmOrderScreen/sub/SelectAddressComponent.dart';

// import 'package:fooder/function/ClassObjects/httpObjectConfirmMenuOrderInBasket.dart';
// import 'package:fooder/function/dataManagement/Readhostname.dart';
// import 'package:fooder/function/dataManagement/dataOrderMenu.dart';
// import 'package:fooder/function/dataManagement/dataUserInfo.dart';
// import 'package:fooder/function/http/httpConfirmMenuOrderInBasket.dart';

// class ConfirmOrderScreen extends StatefulWidget {
//   final Function deletePostID;
//   final String post_id;
//   final MenuCard menuCard;
//   ConfirmOrderScreen(
//       {@required this.post_id,
//       @required this.menuCard,
//       @required this.deletePostID});
//   @override
//   _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
// }

// class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
//   int total_cost = 0;
//   String address_user_id;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     CalulateTotalCost();
//     print("${this.widget.post_id}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget TextBar = Container(
//       height: 50,
//       alignment: Alignment.center,
//       child: Text(
//         "ยืนยันการซื้อสินค้า",
//         style: TextStyle(color: Colors.grey, fontSize: 35),
//       ),
//     );
//     // Widget MenuCardComponent = BasketCardComponent(
//     //   post_id: this.widget.post_id,
//     //   menuCard: this.widget.menuCard,
//     // );

//     Widget ShopInfoComponent = Container(
//       height: 50,
//       child: Row(
//         children: [
//           Container(
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 // border: BorderRadius.circular(10),
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                         "${HostName()}/image/ImageProfileShop/" +
//                             this.widget.menuCard.shopInfo.shop_image))),
//           ),
//           Text("${this.widget.menuCard.shopInfo.shop_name}"),
//           Expanded(
//               child: Container(
//             alignment: Alignment.centerRight,
//             child: GestureDetector(
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.only(right: 10),
//                 decoration: BoxDecoration(
//                     color: Colors.red, borderRadius: BorderRadius.circular(10)),
//                 child: Text("ซื้อสินค้าเพิ่ม"),
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//     Widget OrderMenuComponent = Container(
//       margin: EdgeInsets.all(3),
//       padding: EdgeInsets.only(top: 5, bottom: 2),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10)),
//       // height: 100,
//       child: Column(
//         children: [
//           ShopInfoComponent,
//           BasketCardMenuComponent(
//             bufferMenu: this.widget.menuCard.bufferMenu,
//           ),
//           Container(
//             height: 50,
//             alignment: Alignment.centerRight,
//             padding: EdgeInsets.only(right: 20),
//             child: Text(
//               "ค่าจัดส่ง ${this.widget.menuCard.cost} บาท",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//     );
//     Widget ToTalComponent = Container(
//       height: 40,
//       width: double.infinity,
//       alignment: Alignment.centerRight,
//       padding: EdgeInsets.only(right: 20),
//       decoration: BoxDecoration(
//           color: Colors.transparent,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(5), topRight: Radius.circular(5))),
//       child: Text(
//         "ราคารวม  ${this.total_cost}  บาท",
//         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//       ),
//     );
//     //ปุ่มยืนยันออเดอะรฺ
//     Widget ConfirmButton = GestureDetector(
//       onTap: () {
//         // httpConfirmOrder();
//         ConfirmOrderDialog();
//       },
//       child: Container(
//         height: double.infinity,
//         width: double.infinity,
//         margin: EdgeInsets.all(5),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             color: Colors.red, borderRadius: BorderRadius.circular(10)),
//         child: Text("ยืนยันการสั่งซื้อ"),
//       ),
//     );
//     //ปุ่มยกเลิกออเดอะ
//     Widget CancelButton = GestureDetector(
//       onTap: () {
//         print("cancel");
//       },
//       child: Container(
//         height: double.infinity,
//         width: double.infinity,
//         margin: EdgeInsets.all(5),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             color: Colors.red, borderRadius: BorderRadius.circular(10)),
//         child: Text("ยกเลิกการสั่งซื้อ"),
//       ),
//     );

//     //ปุ่ม 2 ปุ่มที่ใช้ยืนยัน หรือ ยกเลิก ออเดอะร์
//     Widget ButtomOrderBar = Container(
//       height: 60,
//       width: double.infinity,
//       // color: Colors.black,
//       child: Row(
//         children: [
//           Expanded(child: ConfirmButton),
//           Expanded(child: CancelButton)
//         ],
//       ),
//     );

//     //บอตตอมบาร์  อยู่ด่านล่าง ใช้จัดการการสั่งซื้อและสรุปยอดรวมราคาสินค้า
//     Widget BottomBar = Container(
//       height: 100,
//       color: Colors.transparent,
//       child: Column(
//         children: [ToTalComponent, ButtomOrderBar],
//       ),
//     );

//     //เลื่อกที่อยู่การจัดส่ง
//     // Widget SelectAddressComponent = Container(
//     //   height: 500,
//     // );
//     return Scaffold(
//       bottomNavigationBar: BottomBar,
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Colors.red,
//         child: ListView(
//           children: [
//             TextBar,
//             OrderMenuComponent,
//             SelectAddressComponent(
//               set_address_user_id: setstate_address_user_id,
//             )
//           ], //
//         ),
//       ),
//     );
//   }

//   //ใช้คำนวนราคารวมทั้งหมด
//   Future CalulateTotalCost() async {
//     int total = 0;
//     int sendCost = this.widget.menuCard.cost == null //ค่าส่งสินค้า
//         ? 0
//         : this.widget.menuCard.cost;

//     //วนรูป นับสินค้า คูนกับราคาสินค้านั้น
//     this.widget.menuCard.bufferMenu.forEach((key, value) {
//       int costX = value.cost * value.quantity;
//       total += costX;
//     });
//     total += sendCost;
//     // return total;
//     setState(() {
//       total_cost = total;
//     });
//   }

//   Future setstate_address_user_id(@required String _address_user_id) {
//     setState(() {
//       address_user_id = _address_user_id;
//     });
//   }

//   Future<int> httpConfirmOrder() async {
//     String user_id = UserInfoManagement().User_id();
//     ConfirmMenuOrderInBasketRequest bufferConfirmMenuOrderInBasketRequest =
//         ConfirmMenuOrderInBasketRequest(
//             user_id: user_id,
//             post_id: this.widget.post_id,
//             address_user_id: address_user_id);

//     ConfirmMenuOrderInBasketResponse bufferConfirmMenuOrderInBasketResponse =
//         await HttpConfirmMenuOrderInBasket(
//             bufferConfirmMenuOrderInBasketRequest);
//     print("${bufferConfirmMenuOrderInBasketResponse.code}");
//     if (bufferConfirmMenuOrderInBasketResponse.code == '20200') {
//       return 1;
//     } else {
//       return 0;
//     }
//   }

//   Future checkREsponse() async {
//     int check = await httpConfirmOrder();
//     if (check == 1) {
//       this.widget.deletePostID(this.widget.post_id);
//       int check1 = await alertCard();
//       if (check1 == 1) {
//         Navigator.of(context).pop(1);
//       }
//     } else {
//       print("error");
//     }
//   }

//   Future ConfirmOrderDialog() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: Text("ยืนยันการสั่งซื้อ"),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     checkREsponse();
//                     Navigator.of(context).pop(1);
//                   },
//                   child: Text("ยืนยัน")),
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(1);
//                   },
//                   child: Text("ยกเลิก")),
//             ],
//           );
//         });
//   }

//   Future<int> alertCard() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: Text("ยืนยันการซื้อสำเร็จ"),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(1);
//                   },
//                   child: Text("ตกลง"))
//             ],
//           );
//         });
//   }
// }
