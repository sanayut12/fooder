import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackButton21 extends StatefulWidget {
  @override
  _BackButton21State createState() => _BackButton21State();
}

class _BackButton21State extends State<BackButton21> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.red;
        });
        await Future.delayed(Duration(microseconds: 50));
        setState(() {
          color = Colors.white;
        });
        Navigator.of(context).pop();
      },
      child: Container(
        height: 65,
        width: 65,
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 50,
          color: color,
        ),
      ),
    );
  }
}
