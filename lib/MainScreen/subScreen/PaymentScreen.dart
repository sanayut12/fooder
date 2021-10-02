import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectPayment.dart';
import 'package:fooder/function/dataManagement/socketManagement.dart';
import 'package:fooder/function/http/httpPayment.dart';

class PaymentScreen extends StatefulWidget {
  final String bill_id;
  PaymentScreen({@required this.bill_id});
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentResponse data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GeneratePaymentQrcode();
  }

  @override
  Widget build(BuildContext context) {
    Widget ShowTitle = Container(
      height: MediaQuery.of(context).size.width * 0.1,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        "ชำระสินค้า พร้อมเพย์",
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.09),
      ),
    );
    Widget ShowQrcode = Container(
      height: MediaQuery.of(context).size.width * 0.8,
      width: MediaQuery.of(context).size.width * 0.8,
      // color: Colors.red,
      decoration: data == null
          ? BoxDecoration(color: Colors.red)
          : BoxDecoration(
              image: DecorationImage(image: MemoryImage(data.image))),
    );

    Widget ShowCost = Container(
      child: Text("ที่ต้องชำระ ${data == null ? 0 : data.cost} บาท"),
    );

    Widget ShowRef = Container(
      child: Text("รหัสการชำระ ${data == null ? '' : data.ref}"),
    );

    Widget ShowPaymentAtApp = GestureDetector(
      onTap: () {
        click();
      },
      child: Container(
        height: 100,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: data == null ? Colors.white : Colors.red),
        child: Text("ชำระผ่านแอปธนาคาร"),
      ),
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfffa897b),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfffa897b), Colors.white])),
            child: Column(
              children: [
                ShowTitle,
                ShowRef,
                ShowQrcode,
                ShowCost,
                ShowPaymentAtApp
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> GeneratePaymentQrcode() async {
    PaymentRequest bufferPaymentRequest =
        PaymentRequest(bill_id: this.widget.bill_id);
    PaymentResponse bufferPaymentResponse =
        await HttpPayment(bufferPaymentRequest);
    setState(() {
      data = bufferPaymentResponse;
    });

    SocketManagement().subscript(bufferPaymentResponse.ref, alert);
  }

  Future<void> click() {
    SocketManagement().emit("test", "_message");
  }

  void alert(String _message) async {
    print("${_message}");
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("ชำระตังสำเร็จ"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text("ตกลง"))
            ],
          );
        });
  }
}
