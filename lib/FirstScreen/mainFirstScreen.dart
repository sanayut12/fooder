import 'package:flutter/material.dart';
import 'package:fooder/FirstScreen/login.dart';
import 'package:fooder/FirstScreen/register.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import 'package:fooder/function/dataManagement/readJsonAddress.dart';
import 'package:fooder/function/http/httpGetOrderBasketFooder.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class MainFirstScreen extends StatelessWidget {
  static String routeName = "/first";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: Container(
          margin: EdgeInsets.fromLTRB(20, 80, 20, 80),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border()),
          child: SubFirst()),
    );
  }
}

class SubFirst extends StatefulWidget {
  @override
  _SubFirstState createState() => _SubFirstState();
}

class _SubFirstState extends State<SubFirst> {
  int page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // LoadData();
    this.page = 0;
  }

  Function changeFromRegistered() {
    setState(() {
      this.page = 0;
    });
    // print("hello world");
  }

  @override
  Widget build(BuildContext context) {
    LanguageManagement lgm = LanguageManagement();
    return Consumer(
        builder: (context, DataManagementProvider provider, Widget child) {
      String _language = provider.LanguageValue();
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    "${lgm.value('001', _language)}",
                    style: TextStyle(
                      color: this.page == 1 ? Colors.red : Colors.white,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: this.page == 0 ? Colors.red : Colors.white,
                  ),
                ),
                onTap: () {
                  setState(() {
                    this.page = 0;
                  });
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    "${lgm.value('002', _language)}",
                    style: TextStyle(
                      color: this.page == 0 ? Colors.red : Colors.white,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: this.page == 1 ? Colors.red : Colors.white,
                  ),
                ),
                onTap: () {
                  setState(() {
                    this.page = 1;
                  });
                },
              ),
            ],
          ),
          this.page == 0
              ? LoginScreen(
                  language: _language,
                )
              : Register(
                  language: _language,
                  rePage: changeFromRegistered,
                ),
        ],
      );
    });
  }
}
