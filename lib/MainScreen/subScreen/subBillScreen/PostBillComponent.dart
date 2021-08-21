import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/BillMenuComponent.dart';
import 'package:fooder/MainScreen/subScreen/subBillScreen/OneBillScreen/OneBillScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillCurrent.dart';

class PostBillComponent extends StatefulWidget {
  final Bill bill;
  final ShopInfoBill shopInfoBill; //< data>  มีร้านเดียวเท่านั้น
  final Map<String, ItemBill> bufferItemBill; //<item_id ,data>
  final Map<String, MenuList> bufferMenuList; //<inventory_id , data>
  PostBillComponent(
      {@required this.bill,
      @required this.shopInfoBill,
      @required this.bufferItemBill,
      @required this.bufferMenuList});
  @override
  _PostBillComponentState createState() => _PostBillComponentState();
}

class _PostBillComponentState extends State<PostBillComponent> {
  int length_menu_main = 1;
  int length_menu_fromdata = 5;
  Map<String, ItemBill> bufferItemBill = {}; //<item_id ,data>
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetItem();
  }

  @override
  Widget build(BuildContext context) {
    Widget BillAddress = Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Text("รหัสบิล ${this.widget.bill.bill_id.substring(0, 16)}..."),
    );
    Widget DateSend = Container(
      height: double.infinity,
      // color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("วันที่ ${this.widget.bill.date.ToDateString()}"),
          Text("เวลา ${this.widget.bill.date.ToTimeString()}")
        ],
      ),
    );
    Widget MoreButton = GestureDetector(
      onTap: () {
        setState(() {
          if (length_menu_main == 1) {
            length_menu_main = length_menu_fromdata;
          } else {
            length_menu_main = 1;
          }
        });
      },
      child: Container(
        height: 20,
        width: double.infinity,
        color: Colors.pink[200],
        alignment: Alignment.center,
        child: length_menu_main == 1 ? Text("ดูเพิ่มเติม") : Text("ลดลง"),
      ),
    );
    Widget Detail = Container(
      height: 50,
      width: double.infinity,
      color: Colors.green,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BillAddress,
          DateSend,
        ],
      ),
    );
    Widget BufferMenu = Container(
      height: (length_menu_main.toDouble() * 50),
      width: double.infinity,
      child: ListView.builder(
          itemCount: length_menu_main,
          itemBuilder: (BuildContext context, int index) {
            // print();
            String item_id = bufferItemBill.keys.elementAt(index);
            String inventory_id = bufferItemBill[item_id].inventory_id;
            return BillMenuComponent(
              itemBill: bufferItemBill[item_id],
              menuList: this.widget.bufferMenuList[inventory_id],
            );
          }),
    );
    return Container(
      height: length_menu_fromdata == 1
          ? 50 + (length_menu_main.toDouble() * 50)
          : 70 + (length_menu_main.toDouble() * 50),
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => OneBillScreen(
                        bill: this.widget.bill,
                        shopInfoBill: this.widget.shopInfoBill,
                        bufferItemBill: bufferItemBill,
                        bufferMenuList: this.widget.bufferMenuList,
                      )));
            },
            child: Column(
              children: [
                Detail,
                BufferMenu,
              ],
            ),
          ),
          length_menu_fromdata == 1 ? Container() : MoreButton
        ],
      ),
    );
  }

  void SetItem() async {
    setState(() {
      this.widget.bufferItemBill.forEach((key, value) {
        // print(value.bill_id);
        if (value.bill_id == this.widget.bill.bill_id) {
          bufferItemBill[key] = value;
        }
      });
    });

    length_menu_fromdata = bufferItemBill.length;
    // print(length_menu_fromdata);
  }
}
