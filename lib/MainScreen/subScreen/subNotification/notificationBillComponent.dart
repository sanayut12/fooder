import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fooder/MainScreen/subScreen/FullBillScreen.dart';
import 'package:fooder/MainScreen/subScreen/FullBillScreen2.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/ClassObjects/notificationUsers/httpObjectNotificationBill.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/http/httpGetBillFooderData.dart';

class NotificationBillComponent extends StatefulWidget {
  NotificationBillResponse data;
  NotificationBillComponent({@required this.data});
  @override
  _NotificationBillComponentState createState() =>
      _NotificationBillComponentState();
}

class _NotificationBillComponentState extends State<NotificationBillComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    Widget imageShop = Container(
      height: MediaQuery.of(context).size.width * 0.16,
      width: MediaQuery.of(context).size.width * 0.16,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageProfileShop/${this.widget.data.shop.image}"))),
    );
    String post_detail = this.widget.data.post_shop.detail.length > 20
        ? this.widget.data.post_shop.detail.substring(0, 20) + "..."
        : this.widget.data.post_shop.detail;
    String bill_status = this.widget.data.notification.step;
    String detail_status = "";
    if (bill_status == "1") {
      detail_status = "ได้ยืนยันคำสั่งซื้อแล้ว กรุณาชำระสินค้า";
    } else if (bill_status == "2") {
      detail_status = "ได้ทำการจัดทำสินค้าเสร็จแล้ว";
    } else if (bill_status == "3") {
      detail_status = "กำลังจัดส่งสินค้า";
    } else if (bill_status == "4") {
      detail_status = "จัดส่งสินค้าสำเร็จ";
    }
    Text Detail = Text("จากโพสต์ ${post_detail} ${detail_status}");
    return GestureDetector(
      onTap: () {
        OpenFullBillScreen();
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(bottom: 2, top: 2, left: 5, right: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(weight_screen * 0.03)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageShop,
            Expanded(
              child: Container(
                // color: Colors.green,
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "จากร้าน ${this.widget.data.shop.name} คำสั่งซื้อ ${this.widget.data.notification.bill_id.substring(0, 16)}...",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Detail
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> OpenFullBillScreen() async {
    GetBillFooderDataRequest bufferGetBillFooderDataRequest =
        GetBillFooderDataRequest(
            bill_id: this.widget.data.notification.bill_id);
    GetBillFooderDataResponse data =
        await HttpGetBillFooderData(bufferGetBillFooderDataRequest);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FullBillScreen2(data: data)));
  }
}
