// import 'package:flutter/material.dart';
// import 'package:fooder/MainScreen/subScreen/subBasketScreen/BasketCardComponent.dart';
// import 'package:fooder/function/ClassObjects/httpObjectGetOrderBasketFooder.dart';
// import 'package:fooder/function/dataManagement/dataOrderMenu.dart';
// import 'package:fooder/function/dataManagement/dataUserInfo.dart';
// import 'package:fooder/function/http/httpGetOrderBasketFooder.dart';

// class BasketScreen extends StatefulWidget {
//   @override
//   _BasketScreenState createState() => _BasketScreenState();
// }

// class _BasketScreenState extends State<BasketScreen> {
//   Basket basket;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     httpGetOrderBasketFooder();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget ListCard = ListView.builder(
//         itemCount: basket == null ? 0 : basket.length(),
//         itemBuilder: (context, int index) {
//           return BasketCardComponent(
//             post_id: basket.ListPostID()[index],
//             menuCard: basket.bufferMenuCard[basket.ListPostID()[index]],
//             deletePostID: deletePost_id,
//           );
//         });

//     return Scaffold(
//       body: Container(
//         color: Colors.red,
//         child: ListCard,
//       ),
//     );
//   }

//   Future deletePost_id(String post_id) {
//     print("delete ${post_id} B K S");
//     setState(() {
//       basket.bufferMenuCard.remove(post_id);
//     });
//   }

//   Future httpGetOrderBasketFooder() async {
//     String user_id = UserInfoManagement().User_id();
//     GetOrderBasketFooderRequest bufferGetOrderBasketFooder =
//         GetOrderBasketFooderRequest(user_id: user_id);
//     GetOrderBasketFooderResponse bufferGetOrderBasketFooderResponse =
//         await HttpGetOrderBasketFooder(bufferGetOrderBasketFooder);

//     Basket _basket = bufferGetOrderBasketFooderResponse.basket;
//     print("basket ${_basket.ListPostID()}");
//     setState(() {
//       basket = _basket;
//     });
//   }
// }
