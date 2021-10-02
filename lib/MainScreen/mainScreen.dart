import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooder/Load/LoadScreen.dart';
import 'package:fooder/MainScreen/appBar/AppBar2Fooder.dart';
import 'package:fooder/MainScreen/appBar/AppBarFooder.dart';
import 'package:fooder/MainScreen/component/bottomBar.dart';
import 'package:fooder/MainScreen/drawer/DrawerApp.dart';
import 'package:fooder/MainScreen/subScreen/BasketScreen2.dart';
import 'package:fooder/MainScreen/subScreen/SearchScreen.dart';
import 'package:fooder/MainScreen/subScreen/billScreen2.dart';
import 'package:fooder/MainScreen/subScreen/feedScreen.dart';
import 'package:fooder/MainScreen/subScreen/notificationScreen.dart';
import 'package:fooder/MainScreen/subScreen/BillScreen.dart';
import 'package:fooder/MainScreen/subScreen/profileScreen.dart';
import 'package:fooder/MainScreen/subScreen/BasketScreen.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/module/AlertCard.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';
// import 'package:fooder/module/socketioManagerForgound.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String data;
  int bottomBarIndex = 0;

  ///0-3uj
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDataUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ListSwapScreen(String language) => [
          FeedScreen(
            language: language,
          ),
          BillScreen2(),
          NotificationScreen(),
          ProfileScreen()
        ];

    return WillPopScope(
      onWillPop: () {
        ShowExit();
      },
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          child: DrawerApp(),
        ),
        // appBar: appBarFooder(OpenDrawer, OnClickGotoBasket, null,
        //     OpenSearchScreen, MediaQuery.of(context).size.width),
        body: Consumer(
            builder: (context, DataManagementProvider provider, Widget child) {
          String language = provider.LanguageValue();
          int number = provider.NumberInBasket();
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xfffa897b),
            child: SafeArea(
              child: Column(
                children: [
                  AppBar2Fooder(
                    page: bottomBarIndex,
                    number: number,
                  ),
                  Expanded(
                      flex: 8, child: ListSwapScreen(language)[bottomBarIndex])
                ],
              ),
            ),
          );
        }),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.event, size: 30, color: Colors.white),
            Icon(Icons.notifications, size: 30, color: Colors.white),
            Icon(Icons.account_circle_sharp, size: 30, color: Colors.white),
          ],
          color: Color(0xfffa897b),
          buttonBackgroundColor: Color(0xfffa897b),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              bottomBarIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ),

        //  BottomBar(
        //   bottombarIndex: bottomBarIndex,
        //   changeScreen: ChangeScreen,
        // )
      ),
    );
  }

  // Future<void> ChangeScreen({@required int bottombarindex}) {
  //   setState(() {
  //     bottombarindex;
  //   });
  // }

  Future<void> ShowExit() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertCardAsk(
              message: "ต้องการออกจากแอปหรือไม่", func: ExitApp);
        });
  }

  Future<void> ExitApp() {
    exit(0);
  }

  Future<void> OpenDrawer() {
    _key.currentState.openDrawer();
  }
}
