import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/basket/MenuCardComponent.dart';
import 'package:fooder/function/dataManagement/dataOrderMenu.dart';

class BasketCardMenuComponent extends StatefulWidget {
  final Map<String, Menu> bufferMenu;
  BasketCardMenuComponent({@required this.bufferMenu});
  @override
  _BasketCardMenuComponentState createState() =>
      _BasketCardMenuComponentState();
}

class _BasketCardMenuComponentState extends State<BasketCardMenuComponent> {
  @override
  Widget build(BuildContext context) {
    List<MenuCardComponent> bufferMenuCardComponent = <MenuCardComponent>[];
    this.widget.bufferMenu.forEach((key, value) {
      // print("${key}");
      bufferMenuCardComponent.add(MenuCardComponent(item_id: key, menu: value));
    });

    return Container(
      // height: 100,
      color: Colors.grey,
      margin: EdgeInsets.all(5),
      child: Column(
        children: bufferMenuCardComponent,
      ),
    );
  }
}
