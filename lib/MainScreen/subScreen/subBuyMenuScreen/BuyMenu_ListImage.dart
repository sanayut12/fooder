import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPathImageMenu.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/http/httpGetPathImageMenu.dart';

class BuyMenu_ListImageComponent extends StatefulWidget {
  final DataMenu_PostBox dataMenu;
  final DataInventory_PostBox dataInventory;
  BuyMenu_ListImageComponent(
      {@required this.dataInventory, @required this.dataMenu});
  @override
  _BuyMenu_ListImageComponentState createState() =>
      _BuyMenu_ListImageComponentState();
}

class _BuyMenu_ListImageComponentState
    extends State<BuyMenu_ListImageComponent> {
  List<String> list_image = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPathImageOther();
  }

  @override
  Widget build(BuildContext context) {
    Widget ShowImage(String _image) => Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${HostName()}/image/menuImage/${_image}"))),
          ),
        );
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      alignment: Alignment.center,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list_image.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ShowImage(this.widget.dataMenu.path);
            } else {
              return ShowImage("${list_image[index - 1]}");
            }
          }),
    );
  }

  Future<void> GetPathImageOther() async {
    String inventory_id = this.widget.dataInventory.inventory_id;
    GetPathImageMenuRequest bufferGetPathImageMenuRequest =
        GetPathImageMenuRequest(inventory_id: inventory_id);
    GetPathImageMenuResponse bufferGetPathImageMenuResponse =
        await httpGetPathImageMenu(
            bufferGetPathImageMenuRequest: bufferGetPathImageMenuRequest);
    setState(() {
      bufferGetPathImageMenuResponse.listPathImageMenu.forEach((element) {
        list_image.add(element.path);
      });
    });
  }
}
