import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class Bill2Box_MenuListComponent extends StatefulWidget {
  final GetBillFooderDataResponse data;
  Bill2Box_MenuListComponent({@required this.data});
  @override
  _Bill2Box_MenuListComponentState createState() =>
      _Bill2Box_MenuListComponentState();
}

class _Bill2Box_MenuListComponentState
    extends State<Bill2Box_MenuListComponent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> bufferWidgetMenu = [];
    Widget MenuCard(String _name, String _image, int _quantity, int _cost) =>
        Container(
          height: MediaQuery.of(context).size.width * 0.15,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "${HostName()}/image/menuImage/${_image}"))),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text("${_name}")),
              Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child:
                      Text("${_quantity} * ${_cost}  ${_quantity * _cost} บาท"))
            ],
          ),
        );

    this.widget.data.bufferItems.forEach((key, value) {
      // print(value.inventory_id);
      int quantity = value.quantity;
      int cost = this.widget.data.bufferInventory[value.inventory_id].cost;
      String name = this
          .widget
          .data
          .bufferMenu[
              this.widget.data.bufferInventory[value.inventory_id].menu_id]
          .name;

      String image = this
          .widget
          .data
          .bufferMenu[
              this.widget.data.bufferInventory[value.inventory_id].menu_id]
          .path;
      bufferWidgetMenu.add(MenuCard(name, image, quantity, cost));
    });

    return Container(
      child: Column(
        children: bufferWidgetMenu,
      ),
    );
  }
}
