import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/BuyMenuScreen.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class MenuBoxComponent extends StatefulWidget {
  final DataMenu_PostBox dataMenu;
  final DataInventory_PostBox dataInventory;
  MenuBoxComponent({
    @required this.dataInventory,
    @required this.dataMenu,
  });
  @override
  _MenuBoxComponentState createState() => _MenuBoxComponentState();
}

class _MenuBoxComponentState extends State<MenuBoxComponent> {
  @override
  Widget build(BuildContext context) {
    Widget SelectMenu = GestureDetector(
      onTap: () {
        selectMenu();
      },
      child: Container(
        height: 80,
        width: double.infinity,
        color: Colors.transparent,
        // child: Text("ffff"),
        // color: Colors.red,
      ),
    );

    Widget ImageMenu = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/menuImage/" +
                  this.widget.dataMenu.path))),
    );
    Widget DetailMenu = Container(
      padding: EdgeInsets.only(top: 2, bottom: 3),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: 30,
            // width: 100,
            // padding: ,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text("${this.widget.dataMenu.name}"),
          ),
          SelectMenu,
          Container(
            // height: 25,
            // width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
            child: Text(
              "${this.widget.dataInventory.cost} บาท",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.red,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.red),
      margin: EdgeInsets.only(left: 10),
      child: Stack(
        children: [ImageMenu, DetailMenu],
      ),
    );
  }

  Future<void> selectMenu() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => BuyMenuScreen(
                  dataInventory: this.widget.dataInventory,
                  dataMenu: this.widget.dataMenu,
                )));
  }
}
