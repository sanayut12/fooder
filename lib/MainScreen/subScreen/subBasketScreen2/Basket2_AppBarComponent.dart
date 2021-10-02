import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';

class Basket2_AppBarComponent extends StatefulWidget {
  String language;
  Basket2_AppBarComponent({@required this.language});
  @override
  _Basket2_AppBarComponentState createState() =>
      _Basket2_AppBarComponentState();
}

class _Basket2_AppBarComponentState extends State<Basket2_AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    LanguageManagement lgm = LanguageManagement();
    return Container(
      width: double.infinity,
      height: weight_screen * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          Expanded(
            child: Text(
              "${lgm.value('073', this.widget.language)}",
              style: TextStyle(fontSize: weight_screen * 0.07),
            ),
          )
        ],
      ),
    );
  }
}

// Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.only(
//                   left: weight_screen * 0.05,
//                   right: weight_screen * 0.1,
//                   bottom: weight_screen * 0.01,
//                   top: weight_screen * 0.01),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(weight_screen * 0.05)),
//               child: Text(
//                 "ตะกล้าสินค้า",
//                 style: TextStyle(fontSize: weight_screen * 0.07),
//               ),
//             )
