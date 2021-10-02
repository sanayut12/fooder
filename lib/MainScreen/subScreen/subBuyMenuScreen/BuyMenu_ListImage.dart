import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPathImageMenu.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/http/httpGetPathImageMenu.dart';

class BuyMenu_ListImageComponent extends StatefulWidget {
  String inventory_id;
  GetPostFeedFooderPostShopResponse data;
  BuyMenu_ListImageComponent(
      {@required this.inventory_id, @required this.data});
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
    String menu_id = this
        .widget
        .data
        .bufferDataInventory_PostBox[this.widget.inventory_id]
        .menu_id;
    String image = this.widget.data.bufferDataMenu_PostBox[menu_id].path;
    // print(image);
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
              return ShowImage(image);
            } else {
              return ShowImage("${list_image[index - 1]}");
            }
          }),
    );
  }

  Future<void> GetPathImageOther() async {
    String inventory_id = this.widget.inventory_id;
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
