import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class FullBill_ListMenuComponent extends StatefulWidget {
  final GetBillFooderDataResponse data;
  FullBill_ListMenuComponent({@required this.data});
  @override
  _FullBill_ListMenuComponentState createState() =>
      _FullBill_ListMenuComponentState();
}

class _FullBill_ListMenuComponentState
    extends State<FullBill_ListMenuComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowImage(String _image) => Container(
          height: MediaQuery.of(context).size.width * 0.15,
          width: MediaQuery.of(context).size.width * 0.15,
          // alignment: ,
          decoration: BoxDecoration(
              // shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage("${HostName()}/image/menuImage/${_image}"))),
        );
    Widget ShowName(String _name) =>
        Container(alignment: Alignment.center, child: Text("${_name}"));
    Widget ShowQuantityXCost(int _quantity, int _cost) => Container(
          alignment: Alignment.center,
          child: Text("${_quantity} x ${_cost}"),
        );
    Widget ShowTotal(int _quantity, int _cost) => Container(
          alignment: Alignment.center,
          child: Text("${_quantity * _cost}"),
        );
    Widget MenuCard(String _name, String _image, int _quantity, int _cost) =>
        Container(
          // height: MediaQuery.of(context).size.width * 0.1,
          width: double.infinity,
          child: Row(
            children: [
              ShowImage(_image),
              Expanded(child: ShowName(_name)),
              Expanded(child: ShowQuantityXCost(_quantity, _cost)),
              Expanded(child: ShowTotal(_quantity, _cost)),
            ],
          ),
        );
    List<Widget> bufferWidgetMenu = [];
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
      width: double.infinity,
      child: Column(
        children: bufferWidgetMenu,
      ),
    );
  }
}
