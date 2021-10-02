import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/Basket2_AppBarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBasketScreen2/Basket2_BoxBasketComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_ListPost_id.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetItemInBasket_Items.dart';
import 'package:fooder/function/http/httpGetItemInBasket_ListPost_id.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class BasketScreen2 extends StatefulWidget {
  @override
  _BasketScreen2State createState() => _BasketScreen2State();
}

class _BasketScreen2State extends State<BasketScreen2> {
  // List<String> bufferPost_id = [];
  Map<String, GetItemInBasket_ItemsResponse> data = {};
  bool check_load = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(bufferPost_id);
    GetBasket();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("====================basket screen2 dispost ==================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfffa897b),
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfffa897b), Colors.white])),
            child: Consumer(builder:
                (context, DataManagementProvider provider, Widget child) {
              String language = provider.LanguageValue();
              return Stack(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Basket2_AppBarComponent(
                          language: language,
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  String post_id = data.keys.toList()[index];
                                  return Basket2_BoxBasketComponent(
                                    language: language,
                                    data: data[post_id],
                                    ChangeLoad: ChangeLoad,
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  check_load
                      ? Expanded(
                          child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Colors.grey[200].withOpacity(0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [CircularProgressIndicator()],
                          ),
                        ))
                      : Container()
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<void> GetBasket() async {
    String user_id = UserInfoManagement().User_id();
    print(user_id);
    GetItemInBasket_ListPost_idRequest
        bufferGetItemInBasket_ListPost_idRequest =
        GetItemInBasket_ListPost_idRequest(user_id: user_id);
    GetItemInBasket_ListPost_idResponse
        bufferGetItemInBasket_ListPost_idResponse =
        await HttpGetItemInBasketListPostid(
            bufferGetItemInBasket_ListPost_idRequest:
                bufferGetItemInBasket_ListPost_idRequest);

    for (String post_id
        in bufferGetItemInBasket_ListPost_idResponse.bufferPost_id) {
      // print('kkk : ' + post_id);
      GetItemInBasket_ItemsRequest bufferGetItemInBasket_ItemsRequest =
          GetItemInBasket_ItemsRequest(user_id: user_id, post_id: post_id);
      GetItemInBasket_ItemsResponse bufferGetItemInBasket_ItemsResponse =
          await HttpGetItemInBasketItems(
              bufferGetItemInBasket_ItemsRequest:
                  bufferGetItemInBasket_ItemsRequest);
      setState(() {
        data[post_id] = bufferGetItemInBasket_ItemsResponse;
      });
    }
  }

  Future<void> ChangeLoad(bool status) {
    setState(() {
      check_load = status;
    });
  }
}
