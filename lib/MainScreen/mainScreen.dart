import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/component/bottomBar.dart';
import 'package:fooder/MainScreen/subScreen/feedScreen.dart';
import 'package:fooder/MainScreen/subScreen/notificationScreen.dart';
import 'package:fooder/MainScreen/subScreen/orderScreen.dart';
import 'package:fooder/MainScreen/subScreen/profileScreen.dart';

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
      OrderScreen(),
      NotificationScreen(),
      ProfileScreen()
    ];

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
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                )),
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
}
