import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/Basket2_BoxBasketComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_ListPost_id.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetItemInBasket_ListPost_id.dart';

class BasketScreen2 extends StatefulWidget {
  @override
  _BasketScreen2State createState() => _BasketScreen2State();
}

class _BasketScreen2State extends State<BasketScreen2> {
  List<String> bufferPost_id = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(bufferPost_id);
    GetPost_id();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green,
        child: ListView.builder(
            itemCount: bufferPost_id.length,
            itemBuilder: (BuildContext context, int index) {
              return Basket2_BoxBasketComponent(
                post_id: bufferPost_id[index],
                index: index,
              );
            }),
      ),
    );
  }

  Future<void> GetPost_id() async {
    String user_id = UserInfoManagement().User_id();
    GetItemInBasket_ListPost_idRequest
        bufferGetItemInBasket_ListPost_idRequest =
        GetItemInBasket_ListPost_idRequest(user_id: user_id);
    GetItemInBasket_ListPost_idResponse
        bufferGetItemInBasket_ListPost_idResponse =
        await HttpGetItemInBasketListPostid(
            bufferGetItemInBasket_ListPost_idRequest:
                bufferGetItemInBasket_ListPost_idRequest);

    setState(() {
      bufferPost_id = bufferGetItemInBasket_ListPost_idResponse.bufferPost_id;
    });
    print(bufferPost_id);
  }

  Future<void> DeleteBasket(int _index) {
    print("${_index}");
    setState(() {
      bufferPost_id.removeAt(_index);
    });
    print(bufferPost_id);
  }
}
