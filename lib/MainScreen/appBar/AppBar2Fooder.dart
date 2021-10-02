import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/appBar/subAppbar2/AppBar2_IconButtonComponent.dart';
import 'package:fooder/MainScreen/subScreen/BasketScreen2.dart';
import 'package:fooder/MainScreen/subScreen/SearchScreen.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class AppBar2Fooder extends StatefulWidget {
  int page;
  int number;
  AppBar2Fooder({@required this.page, @required this.number});
  @override
  _AppBar2FooderState createState() => _AppBar2FooderState();
}

class _AppBar2FooderState extends State<AppBar2Fooder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    return Container(
      height: weight_screen * 0.15,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppBar2_IconButtonComponent(
                  icon: Icons.search,
                  fun: OpenSearchScreen,
                  number: 0,
                ),
                AppBar2_IconButtonComponent(
                  icon: Icons.add_shopping_cart_rounded,
                  fun: OpenBasketScreen,
                  number: this.widget.number,
                ),
                AppBar2_IconButtonComponent(
                  icon: Icons.chat,
                  fun: null,
                  number: 0,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Future OpenBasketScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => BasketScreen2()));
  }

  Future<void> OpenSearchScreen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => SearchScreen()));
  }
}
