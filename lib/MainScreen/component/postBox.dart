import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/component/menuBox.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';

class PostBoxComPonent extends StatefulWidget {
  final Map<String, DataPost> dataPost;
  final DataShopInfo dataShopInfo;
  PostBoxComPonent({this.dataPost, this.dataShopInfo});
  @override
  _PostBoxComPonentState createState() => _PostBoxComPonentState();
}

class _PostBoxComPonentState extends State<PostBoxComPonent> {
  String post_id;
  DataPost dataPost;
  DataShopInfo dataShopInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataShopInfo = this.widget.dataShopInfo;

    String _post_id = this.widget.dataPost.keys.single;

    setState(() {
      post_id = _post_id;
      dataPost = this.widget.dataPost[post_id];
      dataShopInfo = this.dataShopInfo;
    });
  }
  // String

  @override
  Widget build(BuildContext context) {
    Widget ShopInfoWidget = Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.black,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${HostName()}/image/ImageProfileShop/" +
                        dataShopInfo.image,
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 2),
            height: double.infinity,
            child: Text(
              "${dataShopInfo.name}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200),
            ),
          )
        ],
      ),
    );
    Widget DateANDSendcostWidget = Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 10),
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${dataPost.start.ToString()}"),
          Text("ค่าจัดส่ง ${dataPost.sendCost} บาท")
        ],
      ),
    );
    // ส่วนการแสดงผล ของขอความที่รเานค้าทีำการโพสต์มา
    Widget DetailWidget = Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.blue,
      child: dataPost.detail == 'null' ? Text("") : Text("${dataPost.detail}"),
    );

    //ส่วนของการแสกดง list รายการเมนูอาหารของโพสต์นั้นๆ
    Widget MenuListWidget = Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.pink,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataPost.bufferMenu.length,
          itemBuilder: (context, int index) {
            // print("context : ${context}");
            // print("index :${index}");

            return MenuBoxWidget(dataMenu: dataPost.bufferMenu[index]);
          }),
    );

    //แสดง ข้อความ วันที่ปิดการขายกับวันที่ส่ง
    Widget DateStopSendWidget = Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ปิดการขาย ${dataPost.stop.ToString()}"),
          Text("การจัดส่ง ${dataPost.send.ToString()}")
        ],
      ),
    );

    //แสดงข้อมมูล การซื่นชอบ การติดตามการแชร์การแทรก etc.
    Widget InteractiveWidget = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.amber,
    );
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: double.infinity,
      height: 400,
      // color: Colors.red,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: Column(
        children: [
          Expanded(flex: 2, child: ShopInfoWidget), //shop info
          Expanded(flex: 1, child: DateANDSendcostWidget), //date AND SENDCOST
          Expanded(flex: 3, child: DetailWidget), //detail
          Expanded(flex: 6, child: MenuListWidget), //MENU
          Expanded(flex: 1, child: DateStopSendWidget), //DTAE SEND CLOSE
          Expanded(
            flex: 1,
            child: InteractiveWidget,
          ), //INTERACTIVE
        ],
      ),
    );
  }
}
