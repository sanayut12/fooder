import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/menuBoxComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_ListMenu extends StatefulWidget {
  GetPostFeedFooderPostShopResponse data;
  final Function PopUpAddItemToBasket;
  PostBox_ListMenu({@required this.data, @required this.PopUpAddItemToBasket});
  @override
  _PostBox_ListMenuState createState() => _PostBox_ListMenuState();
}

class _PostBox_ListMenuState extends State<PostBox_ListMenu> {
  @override
  Widget build(BuildContext context) {
    // final List<DataInventory_PostBox> bufferDataInventory_PostBox;
    // final Map<String, DataMenu_PostBox> bufferDataMenu_PostBox;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.8,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.widget.data.bufferDataInventory_PostBox.length,
          itemBuilder: (BuildContext context, int index) {
            String inventory_id = this
                .widget
                .data
                .bufferDataInventory_PostBox
                .keys
                .toList()[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuBoxComponent(
                  inventory_id: inventory_id,
                  data: this.widget.data,
                  PopUpAddItemToBasket: this.widget.PopUpAddItemToBasket,
                ),
              ],
            );
          }),
    );
  }
}
