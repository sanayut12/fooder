import 'package:flutter/cupertino.dart';

class FullBil_TitleTableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget Title1 = Container(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Text(""),
    );
    TextStyle titleStyle = TextStyle(fontWeight: FontWeight.bold);
    Widget Title2 = Container(
      alignment: Alignment.center,
      child: Text(
        "รายการ",
        style: titleStyle,
      ),
    );
    Widget Title3 = Container(
      alignment: Alignment.center,
      child: Text(
        "จำนวน x ราคา",
        style: titleStyle,
      ),
    );
    Widget Title4 = Container(
      alignment: Alignment.center,
      child: Text(
        "รวม",
        style: titleStyle,
      ),
    );
    // Widget Title1 = Container(
    //   child: Text("data"),
    // );
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("รายการสินค้า"),
          Row(
            children: [
              Title1,
              Expanded(child: Title2),
              Expanded(child: Title3),
              Expanded(child: Title4)
            ],
          ),
        ],
      ),
    );
  }
}
