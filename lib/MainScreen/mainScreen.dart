import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/component/bottomBar.dart';
import 'package:fooder/MainScreen/subScreen/BasketScreen2.dart';
import 'package:fooder/MainScreen/subScreen/feedScreen.dart';
import 'package:fooder/MainScreen/subScreen/notificationScreen.dart';
import 'package:fooder/MainScreen/subScreen/BillScreen.dart';
import 'package:fooder/MainScreen/subScreen/profileScreen.dart';
import 'package:fooder/MainScreen/subScreen/BasketScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String data;
  int bottomBarIndex = 0;

  ///0-3uj

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDataUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ListSwapScreen = [
      FeedScreen(),
      BillScreen(),
      NotificationScreen(),
      ProfileScreen()
    ];

    Widget TopBar = Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      color: Colors.red[400],
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "fooder",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      OnClickGotoBasket();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 2, right: 2),
                      padding: EdgeInsets.only(top: 3, bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.add_shopping_cart_rounded,
                        size: 40,
                        color: Colors.grey[700],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(top: 3, bottom: 3),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    // color: Colors.blue,
                    child: Icon(Icons.chat, size: 40, color: Colors.grey[700]),
                  ))
                ],
              ))
        ],
      ),
    );
    return Scaffold(
        drawer: Drawer(
          child: Container(
            height: double.infinity,
            width: 200,
            color: Colors.red,
          ),
        ),
        body: Column(
          children: [
            Expanded(flex: 1, child: TopBar),
            Expanded(flex: 8, child: ListSwapScreen[bottomBarIndex])
          ],
        ),
        bottomNavigationBar: BottomBar(
          bottombarIndex: bottomBarIndex,
          changeScreen: ChangeScreen,
        ));
  }

  Future<void> ChangeScreen({@required int bottombarindex}) {
    setState(() {
      bottomBarIndex = bottombarindex;
    });
  }

  Future OnClickGotoBasket() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => BasketScreen2()));
  }
}
