import 'package:flutter/material.dart';
import 'package:fooder/FirstScreen/login.dart';
import 'package:fooder/FirstScreen/register.dart';
import 'package:fooder/FirstScreen/subMainFirst/MainFirst_SelectBarComponent.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class MainFirstScreen extends StatelessWidget {
  static String routeName = "/first";
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    double height_screen = MediaQuery.of(context).size.height;
    Widget ShowTopBackground = Container(
      width: weight_screen,
      height: weight_screen * 0.9,
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/app_image/FirstMainImage.png"))),
    );
    Widget ShowButtomBackground = Container(
      width: weight_screen,
      height: weight_screen * 0.8,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
              image: AssetImage("assets/app_image/vegetables-basket.png"))),
    );
//
    Widget BackPage = Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ShowTopBackground, ShowButtomBackground],
        ));

    Widget FrontPage = Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
            height: weight_screen * 1.2,
            width: weight_screen * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border()),
            child: SubFirst()));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[200],
            child: Stack(
              children: [
                BackPage,
                FrontPage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubFirst extends StatefulWidget {
  @override
  _SubFirstState createState() => _SubFirstState();
}

class _SubFirstState extends State<SubFirst> {
  bool active = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LanguageManagement lgm = LanguageManagement();
    double weight_screen = MediaQuery.of(context).size.width;
    double height_screen = MediaQuery.of(context).size.height;

    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    String _language = provider.LanguageValue();

    return Container(
      height: weight_screen * 1.2,
      width: weight_screen * 0.8,
      // padding: EdgeInsets.all(10),
      child: Column(
        children: [
          MainFirst_SelectBarComponent(
              fun: changeFromRegistered, active: active),
          active
              ? LoginScreen(
                  language: _language,
                )
              : Register(
                  language: _language,
                  rePage: changeFromRegistered,
                ),
        ],
      ),
    );
  }

  Future<void> changeFromRegistered(bool _active) {
    setState(() {
      active = _active;
    });
  }
}
