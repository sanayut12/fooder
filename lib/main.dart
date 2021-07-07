import 'package:flutter/material.dart';
import 'package:fooder/FirstScreen/mainFirstScreen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, bottomAppBarColor: Colors.transparent),
      home: MainScreen(),
    );
  }
}
