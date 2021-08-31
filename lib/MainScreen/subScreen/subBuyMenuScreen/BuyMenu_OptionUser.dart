import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyMenu_OptionUser extends StatefulWidget {
  final String comment;
  final int quantity;
  final Function SetQuantity, SetComment, CallAddBaseket, CallBuyNow;
  BuyMenu_OptionUser(
      {@required this.quantity,
      @required this.comment,
      @required this.SetQuantity,
      @required this.SetComment,
      @required this.CallBuyNow,
      @required this.CallAddBaseket});
  @override
  _BuyMenu_OptionUserState createState() => _BuyMenu_OptionUserState();
}

class _BuyMenu_OptionUserState extends State<BuyMenu_OptionUser> {
  TextEditingController textComment;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textComment = TextEditingController(text: this.widget.comment);
  }

  @override
  Widget build(BuildContext context) {
    Widget Increased_Quantity = GestureDetector(
      onTap: () {
        this.widget.SetQuantity(1);
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        alignment: Alignment.center,
        child: Icon(Icons.add),
      ),
    );
    Widget Decreased_Quantity = GestureDetector(
      onTap: () {
        this.widget.SetQuantity(-1);
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        alignment: Alignment.center,
        child: Icon(Icons.reduce_capacity),
      ),
    );
    Widget Quantity_Bar = Container(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Decreased_Quantity,
          Text("${this.widget.quantity}"),
          Increased_Quantity
        ],
      ),
    );
    Widget ButtonModel(String text, Function _call) => GestureDetector(
          onTap: () {
            _call();
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.red),
            alignment: Alignment.center,
            child: Text("${text}"),
          ),
        );

    Widget TextComment = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ส่งข้อความถึงร้านค้า"),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red, width: 1)),
            child: TextFormField(
              controller: textComment,
              onChanged: (e) {
                this.widget.SetComment(e);
              },
              minLines: 2,
              maxLines: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.amber,
      child: Column(
        children: [
          Quantity_Bar,
          TextComment,
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child:
                      ButtonModel("เพิ่มลงตะกล้า", this.widget.CallAddBaseket)),
              Expanded(child: ButtonModel("ซื้อเลย", this.widget.CallBuyNow))
            ],
          )),
        ],
      ),
    );
  }
}
