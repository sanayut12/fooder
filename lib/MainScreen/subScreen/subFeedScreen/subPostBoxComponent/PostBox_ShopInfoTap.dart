import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_ShopInfoTap extends StatefulWidget {
  String language;
  DataShopInfo_PostBox dataShopInfo_PostBox;
  DataPost_PostBox dataPost_PostBox;
  PostBox_ShopInfoTap(
      {@required this.language,
      @required this.dataShopInfo_PostBox,
      @required this.dataPost_PostBox});
  @override
  _PostBox_ShopInfoTapState createState() => _PostBox_ShopInfoTapState();
}

class _PostBox_ShopInfoTapState extends State<PostBox_ShopInfoTap> {
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
    LanguageManagement lgm = LanguageManagement();
    Widget ImageShop = Container(
      height: MediaQuery.of(context).size.width * 0.14,
      width: MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.dataShopInfo_PostBox.image}"))),
    );
    TextStyle styleName = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    Widget NameShop = Container(
      // height: MediaQuery.of(context).size.width * 0.2,
      // width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      child: Text(
        "${this.widget.dataShopInfo_PostBox.name}",
        style: styleName,
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: double.infinity,
      // color: Colors.amber,
      child: Row(
        children: [
          ImageShop,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: NameShop),
                Text(
                    "${date_status} . ${this.widget.dataPost_PostBox.sendCost == 0 ? '${lgm.value('071', this.widget.language)}' : '${lgm.value('036', this.widget.language)} ${this.widget.dataPost_PostBox.sendCost} ${lgm.value('037', this.widget.language)}'}"),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
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
    LanguageManagement lgm = LanguageManagement();
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
        date_status = "${year} ${lgm.value('064', this.widget.language)}";
      });
    } else if (day > 30) {
      //แยกเดือน
      double _month = day / (365 / 12);
      int month = _month.toInt();
      setState(() {
        date_status = "${month} ${lgm.value('063', this.widget.language)}";
      });
    } else {
      //แยกวัน

      if (hour >= 24) {
        setState(() {
          date_status = "${day} ${lgm.value('062', this.widget.language)}";
        });
      } else {
        if (min >= 60) {
          setState(() {
            date_status = "${hour} ${lgm.value('061', this.widget.language)}";
          });
        } else {
          if (min == 0) {
            setState(() {
              date_status = "${lgm.value('059', this.widget.language)}";
            });
          } else {
            setState(() {
              date_status = "${min} ${lgm.value('060', this.widget.language)}";
            });
          }
        }
      }
    }
  }
}
