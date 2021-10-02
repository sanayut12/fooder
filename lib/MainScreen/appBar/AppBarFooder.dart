import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appBarFooder(Function fun1, Function fun2, Function fun3, Function fun4,
        double hight) =>
    AppBar(
      backgroundColor: Color(0xfffa897b),
      shadowColor: Colors.transparent,
      // foregroundColor: Colors.transparent,

      leading: IconButton(
          onPressed: () {
            fun1();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          )),
      toolbarHeight: hight * 0.15,
      actions: [
        Container(
          alignment: Alignment.center,
          // margin: EdgeInsets.only(left: 8, right: 5, top: 2, bottom: 2),
          padding: EdgeInsets.all(hight * 0.02),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {
              fun4();
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          // padding: EdgeInsets.all(2),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          child: IconButton(
              onPressed: () {
                fun2();
              },
              icon: Icon(Icons.add_shopping_cart_rounded)),
        ),
        Container(
          margin: EdgeInsets.only(left: 2),
          // padding: EdgeInsets.all(2),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          child: IconButton(
              onPressed: () {
                fun3();
              },
              icon: Icon(Icons.chat)),
        )
      ],
    );
