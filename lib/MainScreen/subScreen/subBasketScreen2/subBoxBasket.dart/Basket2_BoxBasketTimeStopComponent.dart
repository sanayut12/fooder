import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetItemInBasket_Items.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';

class Basket2_BoxBasketTimeStopComponent extends StatefulWidget {
  String language;
  final BasketBox_PostInfo post_info;
  Basket2_BoxBasketTimeStopComponent(
      {@required this.language, @required this.post_info});
  @override
  _Basket2_BoxBasketTimeStopComponentState createState() =>
      _Basket2_BoxBasketTimeStopComponentState();
}

class _Basket2_BoxBasketTimeStopComponentState
    extends State<Basket2_BoxBasketTimeStopComponent> {
  @override
  Widget build(BuildContext context) {
    LanguageManagement lgm = LanguageManagement();
    Widget ShowTimeStop = Container(
      child: Text(
          "${lgm.value('041', this.widget.language)} ${this.widget.post_info.stop.ToString()}"),
    );

    Widget ShowSendCost = Container(
      child: Text(
          "${lgm.value('036', this.widget.language)}  ${this.widget.post_info.sendCost} ${lgm.value('037', this.widget.language)} "),
    );
    return Container(
      // height: 100,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ShowTimeStop, ShowSendCost],
      ),
    );
  }
}
