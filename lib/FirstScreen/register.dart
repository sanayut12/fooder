import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fooder/ClassObjects/httpObjectRegister.dart';
import '../function/http/httpRegister.dart';

String name, password, confirmpassword, phone, email;

class Register extends StatefulWidget {
  final Function rePage;

  Register({this.rePage});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name, _password, _confirmpassword, _phone, _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = TextEditingController(text: name);
    _password = TextEditingController(text: password);
    _confirmpassword = TextEditingController(text: confirmpassword);
    _phone = TextEditingController(text: phone);
    _email = TextEditingController(text: email);
    initHttpRegister();
  }

  void resetInput() {
    setState(() {
      name = "";
      password = "";
      confirmpassword = "";
      phone = "";
      email = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget NameInput = TextFormField(
      onChanged: (e) {
        setState(() {
          name = e;
        });
      },
      controller: _name,
      decoration: InputDecoration(
          hintText: "Name", hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget PhoneInput = TextFormField(
      onChanged: (e) {
        setState(() {
          phone = e;
        });
      },
      controller: _phone,
      decoration: InputDecoration(
          hintText: "Phone", hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget EmailInput = TextFormField(
      onChanged: (e) {
        setState(() {
          email = e;
        });
      },
      controller: _email,
      decoration: InputDecoration(
          hintText: "Email", hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget PasswordInput = TextFormField(
      onChanged: (e) {
        setState(() {
          password = e;
        });
      },
      controller: _password,
      decoration: InputDecoration(
          hintText: "Password", hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget ConfirmPasswordInput = TextFormField(
      onChanged: (e) {
        setState(() {
          confirmpassword = e;
        });
      },
      controller: _confirmpassword,
      decoration: InputDecoration(
          hintText: "comfirm Password",
          hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget RegisterButton = GestureDetector(
      onTap: () async {
        await registerOnPress();
      },
      child: Container(
        child: Text(
          "Register",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        height: 40,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );

    Widget RegisterForm = Form(
        child: Column(
      children: [
        NameInput,
        PhoneInput,
        EmailInput,
        PasswordInput,
        ConfirmPasswordInput,
        RegisterButton
      ],
    ));
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0), child: RegisterForm);
  }

  //เมื่อเรากดที่จะ register
  Future registerOnPress() async {
    RegisterResponse bufferRegisterResponse = await RegisterHttp();

    if (bufferRegisterResponse.code == 20200) {
      ConfirmRegisterResponse bufferConfirmRegisterResponse =
          await ShowAlertdialogConfirmRegister(bufferRegisterResponse);

      // print("Confirm register response");
      // print(
      //     "${bufferConfirmRegisterResponse.message} ${bufferConfirmRegisterResponse.code} ${bufferConfirmRegisterResponse.key}");
      if (bufferConfirmRegisterResponse.code == 20200) {
        await ShowAlertdialogRegisterSuccesses();
        resetInput();
        this.widget.rePage();
      } else {
        ShowAlertdialogConfirmRegisterFail(bufferConfirmRegisterResponse);
      }
    } else if (bufferRegisterResponse.code == 10001) {
      ShowAlertdialogFail(bufferRegisterResponse);
    }
  }

  //เรียกใช้ api register
  Future<RegisterResponse> RegisterHttp() async {
    RegisterRequest bufferRegisterRequest = RegisterRequest(
        name: name, password: password, email: email, phone: phone);
    RegisterResponse bufferRegisterResponse =
        await HttpRegister(bufferRegisterRequest);
    return bufferRegisterResponse;
  }

  Future<int> ShowAlertdialogFail(RegisterResponse bufferRegisterResponse) {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text("fail"),
            content: Text("${bufferRegisterResponse.message}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ยืนยัน"))
            ],
          );
        });
  }

  Future<ConfirmRegisterResponse> ShowAlertdialogConfirmRegister(
      RegisterResponse bufferRegisterResponse) async {
    TextEditingController code = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext builder) {
        return AlertDialog(
          title: Text("ยืนยันรหัส OTP ของเบอร์ ${phone}"),
          content: Container(
            height: 100,
            width: 200,
            child: Column(
              children: [
                Text('รหัสอ้างอิงคือ ${bufferRegisterResponse.key}'),
                TextField(
                  controller: code,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  ConfirmRegisterResponse bufferConfirmRegisterResponse =
                      await RegisterConfirmHttp(code.text);
                  Navigator.of(context).pop(bufferConfirmRegisterResponse);
                },
                child: Text("ยืนยัน"))
          ],
        );
      },
    );
  }

  Future<ConfirmRegisterResponse> RegisterConfirmHttp(String code) async {
    ConfirmRegisterRequest bufferConfirmRegisterRequest =
        ConfirmRegisterRequest(phone: phone, code: code);

    ConfirmRegisterResponse bufferConfirmRegisterResponse =
        await HttpConfirmRegister(bufferConfirmRegisterRequest);
    return bufferConfirmRegisterResponse;
  }

  Future<bool> ShowAlertdialogRegisterSuccesses() async {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text("successes"),
            content: Text("ลงทะเบียนสำเร็จ"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("ยืนยัน"))
            ],
          );
        });
  }

  Future ShowAlertdialogConfirmRegisterFail(
      ConfirmRegisterResponse bufferConfirmRegisterResponse) {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text("fail"),
            content: Text("${bufferConfirmRegisterResponse.message}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ยืนยัน"))
            ],
          );
        });
  }
}
