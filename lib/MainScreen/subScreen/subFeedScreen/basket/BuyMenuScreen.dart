import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectAddMenutoBasket.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpAddMenuToBasket.dart';

class BuyMenuScreen extends StatefulWidget {
  final DataMenu dataMenu;
  BuyMenuScreen({@required this.dataMenu});
  @override
  _BuyMenuScreenState createState() => _BuyMenuScreenState();
}

class _BuyMenuScreenState extends State<BuyMenuScreen> {
  int quantity = 1;
  String comment = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("${this.widget.dataMenu.inventory_id}");
  }

  @override
  Widget build(BuildContext context) {
    Widget FoodName = Container(
      alignment: Alignment.center,
      child: Text(
        "${this.widget.dataMenu.name}",
        style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600),
      ),
    );

    Widget ImageFood = Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/menuImage/" +
                  this.widget.dataMenu.path))),
    );

    Widget FoodDetail = Container(
      height: double.infinity,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              "จำนวนคงเหลือ ${this.widget.dataMenu.quantity}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              "ราคา ${this.widget.dataMenu.cost} บาท",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ))
        ],
      ),
      // color: Colors.red,
    );

    //ส่วนของการ เพิ่มลบ จำนวนอาหารก่อนจะกดสั่งซื้อ
    Widget Add_number_button = GestureDetector(
      onTap: () {
        NumberItem(1);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.plus_one,
          size: 30,
        ),
      ),
    );
    Widget Minus_number_button = GestureDetector(
      onTap: () {
        NumberItem(-1);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.exposure_minus_1,
          size: 30,
        ),
      ),
    );

    Widget FoodConsoleMenuOption = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Minus_number_button,
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "$quantity",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Add_number_button
        ],
      ),
    );

    //ส่วนของปุ่มกดยื่นยันหรือยกเลิกการสั่งสินค้า
    Widget FoodConsoleButton = Container(
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              CancelMenu();
            },
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              child: Text("ยกเลิก"),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              AddbasketMenu();
            },
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              child: Text("เพิ่มลงตะกล้า"),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              BuyNowMenu();
            },
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              child: Text("ซื้อเลย"),
            ),
          ))
        ],
      ),
    );
    Widget CommentMenu = Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        onChanged: (e) {
          setState(() {
            comment = e;
          });
        },
        decoration: InputDecoration(
            hintText: "บอกรายละเอียดเพิ่มเติมในสินค้า",
            fillColor: Colors.white,
            filled: true),
        maxLines: 3,
      ),
    );
    Widget FoodConsole = Container(
      child: Column(
        children: [
          Expanded(child: FoodConsoleMenuOption),
          Expanded(child: CommentMenu),
          Expanded(child: FoodConsoleButton)
        ],
      ),
    );

    Widget FromByMenu = Column(
      children: [
        Expanded(flex: 1, child: FoodName), //ชื่ออาหาร
        Expanded(flex: 3, child: ImageFood), // รูปอาหาร
        Expanded(flex: 1, child: FoodDetail), //  ข้อมมูลอาหาร

        Expanded(flex: 3, child: FoodConsole) // ปุ้มส่วนควบคุมการซื้อขาย
      ],
    );

    return Scaffold(
      // appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.green,
        child: FromByMenu,
      ),
    );
  }

  Future NumberItem(int number) {
    if (quantity <= 1 && number == -1) {
    } else {
      setState(() {
        quantity += number;
      });
    }
  }

  Future CancelMenu() {
    Navigator.of(context).pop();
  }

  Future AddbasketMenu() {
    httpAddMenuTobasket();
  }

  Future BuyNowMenu() {}

  Future httpAddMenuTobasket() async {
    String user_id = await UserInfoManagement().User_id();
    String inventory_id = this.widget.dataMenu.inventory_id;
    AddMenuTobasketRequest bufferAddMenuTobasketRequest =
        AddMenuTobasketRequest(
            user_id: user_id,
            inventory_id: inventory_id,
            quantity: quantity,
            comment: comment);
    AddMenuToBasketResponse bufferAddMenuToBasketResponse =
        await HttpAddMenuToBasket(bufferAddMenuTobasketRequest);
    print(bufferAddMenuToBasketResponse.code);
    if (bufferAddMenuToBasketResponse.code == "20200") {
      AlertMenu();
    }
  }

  Future AlertMenu() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "คุณได้เพิ่มเมนู ${this.widget.dataMenu.name} ลงตะกล้าสำเร็จ"),
            actions: [
              GestureDetector(
                onTap: () async {
                  await Navigator.of(context).pop();
                  await Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("ตกลง"),
                ),
              )
            ],
          );
        });
  }
}
