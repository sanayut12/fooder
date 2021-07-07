import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/basket/BuyMenuScreen.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class MenuBoxWidget extends StatefulWidget {
  final DataMenu dataMenu;
  MenuBoxWidget({@required this.dataMenu});
  @override
  _MenuBoxWidgetState createState() => _MenuBoxWidgetState();
}

class _MenuBoxWidgetState extends State<MenuBoxWidget> {
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
            height: 30,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text("${this.widget.dataMenu.name}"),
          ),
          SelectMenu,
          Container(
            height: 25,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
            child: Text(
              "${this.widget.dataMenu.cost}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
    return Container(
      height: double.infinity,
      width: 150,
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
                  dataMenu: this.widget.dataMenu,
                )));
  }
}
