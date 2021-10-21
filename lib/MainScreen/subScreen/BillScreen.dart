// import 'package:flutter/material.dart';
// import 'package:fooder/MainScreen/subScreen/subBillScreen/BillComponent.dart';
// import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';
// import 'package:fooder/function/dataManagement/dataUserInfo.dart';
// import 'package:fooder/function/http/httpGetBillCurrent.dart';

// class BillScreen extends StatefulWidget {
//   @override
//   _BillScreenState createState() => _BillScreenState();
// }

// class _BillScreenState extends State<BillScreen> {
//   List<Bill> bufferBill = [];
//   Map<String, ShopInfoBill> bufferShopInfoBill = {}; //<shop_id ,data>
//   Map<String, ItemBill> bufferItemBill = {}; //<item_id ,data>
//   Map<String, MenuList> bufferMenuList = {}; //<inventory_id , data>
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getBillCurrent();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     print("------------------------bill screen dispost-------------------");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: ListView.builder(
//             itemCount: bufferBill.length,
//             itemBuilder: (BuildContext context, int index) {
//               // print(index);
//               Bill bill = bufferBill[index];
//               String shop_id = bill.shop_id;
//               return BillComponent(
//                   bill: bill,
//                   shopInfoBill: bufferShopInfoBill[shop_id],
//                   bufferItemBill: bufferItemBill,
//                   bufferMenuList: bufferMenuList);
//             }));
//   }

//   void getBillCurrent() async {
//     String user_id = UserInfoManagement().User_id();
//     GetBillCurrentRequest bufferGetBillCurrentRequest =
//         GetBillCurrentRequest(user_id: user_id);
//     GetBillCurrentResponse bufferGetBillCurrentResponse =
//         await HttpGetBillCurrent(bufferGetBillCurrentRequest);
//     // print(bufferGetBillCurrentResponse.bufferBill);
//     setState(() {
//       bufferBill = bufferGetBillCurrentResponse.bufferBill;
//       bufferShopInfoBill =
//           bufferGetBillCurrentResponse.bufferShopInfoBill; //<shop_id ,data>
//       bufferItemBill =
//           bufferGetBillCurrentResponse.bufferItemBill; //<item_id ,data>
//       bufferMenuList =
//           bufferGetBillCurrentResponse.bufferMenuList; //<inventory_id , data>
//     });
//   }
// }
