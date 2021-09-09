import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TouchUpDownHeightConponend extends StatefulWidget {
  final Widget render;
  // final dynamic data;
  TouchUpDownHeightConponend({@required this.render});
  @override
  _TouchUpDownHeightConponendState createState() =>
      _TouchUpDownHeightConponendState();
}

class _TouchUpDownHeightConponendState
    extends State<TouchUpDownHeightConponend> {
  double start = 0;
  double update = 0;
  double end = 300;
  double height_current = 300;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: height_current,
          width: double.infinity,
          child: Stack(
            children: [
              this.widget.render,
              GestureDetector(
                onVerticalDragUpdate: (e) {
                  // print("update : ${e.globalPosition.dy}");
                  UpdateValueHeight(e.globalPosition.dy);
                },
                onVerticalDragStart: (e) {
                  StartValueHeight(e.globalPosition.dy);
                  // print("start : ${e.globalPosition.dy}");
                },
                onVerticalDragEnd: (e) {
                  EndValueHeight();
                },
                child: Container(
                  height: height_current,
                  width: double.infinity,
                  color: Colors.transparent,
                  // child: this.widget.render,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> StartValueHeight(double ay) async {
    start = ay;
  }

  Future<void> UpdateValueHeight(double ay) {
    update = ay;
    double _height_current = end + (start - update);

    if (_height_current > 300 && _height_current < 600) {
      setState(() {
        height_current = _height_current;
      });
    }
    // EndValueHeight();
  }

  Future<void> EndValueHeight() {
    setState(() {
      end = height_current;
    });
  }
}

// Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onVerticalDragUpdate: (e) {
//                     print("update : ${e.localPosition}");
//                   },
//                   onVerticalDragEnd: (e) {
//                     print("end : ${e.velocity}");
//                   },
//                   onVerticalDragStart: (e) {
//                     print("start : ${e.localPosition}");
//                   },
//                   child: Container(
//                     height: 500,
//                     width: double.infinity,
//                     color: Colors.red,
//                   ),
//                 )
//               ],
//             )