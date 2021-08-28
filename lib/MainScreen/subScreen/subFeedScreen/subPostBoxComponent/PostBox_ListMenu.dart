import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/menuBoxComponent.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_ListMenu extends StatefulWidget {
  final List<DataInventory_PostBox> bufferDataInventory_PostBox;
  final Map<String, DataMenu_PostBox> bufferDataMenu_PostBox;
  PostBox_ListMenu(
      {@required this.bufferDataInventory_PostBox,
      @required this.bufferDataMenu_PostBox});
  @override
  _PostBox_ListMenuState createState() => _PostBox_ListMenuState();
}

class _PostBox_ListMenuState extends State<PostBox_ListMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.widget.bufferDataInventory_PostBox.length,
          itemBuilder: (BuildContext context, int index) {
            String menu_id =
                this.widget.bufferDataInventory_PostBox[index].menu_id;
            return Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: MenuBoxComponent(
                  dataInventory: this.widget.bufferDataInventory_PostBox[index],
                  dataMenu: this.widget.bufferDataMenu_PostBox[menu_id]),
            );
          }),
    );
  }
}
