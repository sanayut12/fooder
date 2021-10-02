import 'dart:async';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_StatusBar1 extends StatefulWidget {
  final DataPost_PostBox dataPost_PostBox;
  PostBox_StatusBar1({@required this.dataPost_PostBox});
  @override
  _PostBox_StatusBar1State createState() => _PostBox_StatusBar1State();
}

class _PostBox_StatusBar1State extends State<PostBox_StatusBar1> {
  bool check_dispost = true;
  String date_status = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountDateStartPostInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    check_dispost = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      width: double.infinity,
      color: Colors.green,
      padding: EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${date_status}"),
          // Text("${this.widget.dataPost_PostBox.start.ToString()}"),
          Text(this.widget.dataPost_PostBox.sendCost == 0
              ? "ฟรี"
              : "ค่าจัดส่ง ${this.widget.dataPost_PostBox.sendCost} บาท")
        ],
      ),
    );
  }

  Future<void> CountDateStartPostInit() async {
    CountDateStartPost();
    DateTime datetime_now = DateTime.now();
    int sec = datetime_now.second;
    // print(sec);
    await Future.delayed(Duration(seconds: 61 - sec));
    // print("object");
    Timer.periodic(Duration(minutes: 1), (e) {
      if (!check_dispost) {
        e.cancel();
      }
      CountDateStartPost();
    });
  }

  Future<void> CountDateStartPost() {
    DateTime datetime_now = DateTime.now();
    DateTime datetime_start = this.widget.dataPost_PostBox.start.datetime();
    Duration datetime_diff = datetime_now.difference(datetime_start);

    int day = datetime_diff.inDays;
    int hour = datetime_diff.inHours;
    int min = datetime_diff.inMinutes;
    // print("day === ${day}");
    // print("hour === ${hour}");
    // print("min === ${min}");

    if (day > 365) {
      //แยกปี
      double _year = day / 365;
      int year = _year.toInt();
      setState(() {
        date_status = "ปี ${year} ที่แล้ว";
      });
    } else if (day > 30) {
      //แยกเดือน
      double _month = day / (365 / 12);
      int month = _month.toInt();
      setState(() {
        date_status = "${month} เดือน";
      });
    } else {
      //แยกวัน

      if (hour >= 24) {
        setState(() {
          date_status = "${day} วัน";
        });
      } else {
        if (min >= 60) {
          setState(() {
            date_status = "${hour} ชั่วโมง";
          });
        } else {
          if (min == 0) {
            setState(() {
              date_status = "เมื่อซักครู่";
            });
          } else {
            setState(() {
              date_status = "${min} นาที";
            });
          }
        }
      }
    }
  }
}
