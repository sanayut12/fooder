import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fooder/FirstScreen/mainFirstScreen.dart';
import 'package:flutter/services.dart';
import 'package:fooder/Load/LoadScreen.dart';
import 'package:fooder/MainScreen/mainScreen.dart';
import 'package:fooder/module/BackgroundService.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

String name;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterBackgroundService.initialize(onStartBackGroundService);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String initRoute = "/load";

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return DataManagementProvider();
        })
      ],
      child: MaterialApp(
        title: 'Fooder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue, bottomAppBarColor: Colors.transparent),
        // home: LoadScreen(), //MainScreen(),
        initialRoute: initRoute,
        routes: <String, WidgetBuilder>{
          LoadScreen.routeName: (context) => LoadScreen(),
          MainFirstScreen.routeName: (context) => MainFirstScreen(),
          MainScreen.routeName: (context) => MainScreen()
        },
      ),
    );
  }
}
