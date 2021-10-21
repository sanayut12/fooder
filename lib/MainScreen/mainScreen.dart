import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/appBar/AppBar2Fooder.dart';
import 'package:fooder/MainScreen/drawer/DrawerApp.dart';
import 'package:fooder/MainScreen/subScreen/billScreen2.dart';
import 'package:fooder/MainScreen/subScreen/feedScreen.dart';
import 'package:fooder/MainScreen/subScreen/notificationScreen.dart';
import 'package:fooder/MainScreen/subScreen/profileScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetChatMessage.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetListChatManager.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetChatMessage.dart';
import 'package:fooder/function/http/httpGetListChatManager.dart';
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
    initUsers();
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

  Future<void> initUsers() async {
    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    provider.initSocket();
    provider.UpdateBasket();
    String user_id = UserInfoManagement().User_id();
    GetListChatManagerRequest bufferGetListChatManagerRequest =
        GetListChatManagerRequest(user_id: user_id);
    GetListChatManagerResponse bufferGetListChatManagerResponse =
        await HttpGetListChatManager(
            bufferGetListChatManagerRequest: bufferGetListChatManagerRequest,
            host: HostName());
    List<String> bufferChatManager_id =
        bufferGetListChatManagerResponse.bufferChatManager_id;
    Map<String, ChatManager> bufferChatManager =
        bufferGetListChatManagerResponse.bufferChatManager;
    Map<String, ShopProfileMini> bufferShopProfileMini =
        bufferGetListChatManagerResponse.bufferShopProfileMini;

    bufferShopProfileMini.forEach((key, value) {
      provider.AddUsers(key, value);
    });

    bufferChatManager.forEach((key, value) {
      provider.AddChatmanager(key, value);
    });

    for (String chatmanager_id in bufferChatManager_id) {
      GetChatMessageRequest bufferGetChatMessageRequest =
          GetChatMessageRequest(chatmanager_id: chatmanager_id);
      GetChatMessageResponse bufferGetChatMessageResponse =
          await HttpGetChatMessage(
              bufferGetChatMessageRequest: bufferGetChatMessageRequest,
              host: HostName());

      int len_chatbox = bufferGetChatMessageResponse.bufferChatBox.length;

      for (String chatmessage_id in bufferGetChatMessageResponse
          .bufferChatBox.keys
          .toList()
          .reversed) {
        provider.AddChatBox(chatmessage_id,
            bufferGetChatMessageResponse.bufferChatBox[chatmessage_id]);
      }
    }

    bufferChatManager_id.forEach((element) {
      provider.AddChatSort(element);
    });
  }
}
