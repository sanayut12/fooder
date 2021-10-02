import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class Drawer_ChangeLangaugeComponent extends StatefulWidget {
  @override
  _Drawer_ChangeLangaugeComponentState createState() =>
      _Drawer_ChangeLangaugeComponentState();
}

class _Drawer_ChangeLangaugeComponentState
    extends State<Drawer_ChangeLangaugeComponent> {
  Color color = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      height: weight_screen * 0.2,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Consumer(builder:
                (context, DataManagementProvider provider, Widget child) {
              String language = provider.LanguageValue();
              return GestureDetector(
                  onTap: () async {
                    setState(() {
                      color = Colors.white;
                    });
                    await Future.delayed(Duration(milliseconds: 50));
                    setState(() {
                      color = Colors.yellow;
                    });
                    await Future.delayed(Duration(milliseconds: 50));
                    if (language == 'th') {
                      provider.ChangeLanguage('en');
                    } else if (language == 'en') {
                      provider.ChangeLanguage('th');
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: weight_screen * 0.1,
                        right: weight_screen * 0.1,
                        top: weight_screen * 0.05,
                        bottom: weight_screen * 0.05),
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: Text("${language}"),
                  ));
            }),
          )
        ],
      ),
    );
  }
}
