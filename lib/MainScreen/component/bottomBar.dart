import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int bottombarIndex;
  final Function changeScreen;
  BottomBar({this.bottombarIndex, this.changeScreen});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blueGrey[50],
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  this.widget.changeScreen(bottombarindex: 0);
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Icon(
                    this.widget.bottombarIndex == 0
                        ? Icons.home_filled
                        : Icons.home_outlined,
                    size: 40,
                    color: this.widget.bottombarIndex == 0
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  this.widget.changeScreen(bottombarindex: 1);
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Icon(
                    this.widget.bottombarIndex == 1
                        ? Icons.description_rounded
                        : Icons.description_outlined,
                    size: 40,
                    color: this.widget.bottombarIndex == 1
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  this.widget.changeScreen(bottombarindex: 2);
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Icon(
                    this.widget.bottombarIndex == 2
                        ? Icons.notifications_rounded
                        : Icons.notifications_outlined,
                    size: 40,
                    color: this.widget.bottombarIndex == 2
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  this.widget.changeScreen(bottombarindex: 3);
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Icon(
                    this.widget.bottombarIndex == 3
                        ? Icons.person_sharp
                        : Icons.person_outline,
                    size: 40,
                    color: this.widget.bottombarIndex == 3
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
