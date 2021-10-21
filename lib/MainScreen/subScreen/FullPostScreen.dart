import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/postBoxComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';

class FullPostScreen extends StatefulWidget {
  GetPostFeedFooderPostShopResponse data;
  FullPostScreen({@required this.data});
  @override
  _FullPostScreenState createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
  bool check_addItem = false;
  @override
  Widget build(BuildContext context) {
    GetPostFeedFooderPostShopResponse data = this.widget.data;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green,
        child: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              PostBoxComponent(
                data: data,
                PopUpAddItemToBasket: this.PopUpAddItemToBasket,
              )
            ],
          ),
        )),
      ),
    );
  }

  Future PopUpAddItemToBasket() async {
    setState(() {
      check_addItem = true;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      check_addItem = false;
    });
  }
}
