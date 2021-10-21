import 'package:flutter/material.dart';
import 'package:fooder/FirstScreen/subRegister/Register_ButtonComponent.dart';
import 'package:fooder/FirstScreen/subRegister/Register_ConfirmPasswordComponent.dart';
import 'package:fooder/FirstScreen/subRegister/Register_EmailComponent.dart';
import 'package:fooder/FirstScreen/subRegister/Register_NameComponent.dart';
import 'package:fooder/FirstScreen/subRegister/Register_PasswordComponent.dart';
import 'package:fooder/FirstScreen/subRegister/Register_PhoneComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectRegister.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import '../function/http/httpRegister.dart';

class Register extends StatefulWidget {
  String language;
  final Function rePage;

  Register({@required this.rePage, @required this.language});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = "";
  String password = "";
  String confirmpassword = "";
  String phone = "";
  String email = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    LanguageManagement lgm = LanguageManagement();
    double weight_screen = MediaQuery.of(context).size.width;

    return Container(
        height: weight_screen,
        width: weight_screen * 0.8,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
          autovalidate: true,
          child: Column(
            children: [
              Register_NameComponent(name: name, fun: SetName),
              Register_PhoneComponent(phone: phone, fun: SetPhone),
              Register_EmailComponent(email: email, fun: SetEmail),
              Register_PasswordComponent(password: password, fun: SetPassword),
              Register_ConfirmPasswordComponent(
                  password: password,
                  confirmpassword: confirmpassword,
                  fun: SetConfirmPassword),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: Register_ButtonComponent(fun: registerOnPress),
              ))
            ],
          ),
        ));
  }

  Future<void> SetName(String _name) {
    setState(() {
      name = _name;
    });
  }

  Future<void> SetPhone(String _phone) {
    setState(() {
      phone = _phone;
    });
  }

  Future<void> SetEmail(String _email) {
    setState(() {
      email = _email;
    });
  }

  Future<void> SetPassword(String _password) {
    setState(() {
      password = _password;
    });
  }

  Future<void> SetConfirmPassword(String _confirmpassword) {
    setState(() {
      confirmpassword = _confirmpassword;
    });
  }

  //เมื่อเรากดที่จะ register
  Future<void> registerOnPress() async {
    RegisterResponse bufferRegisterResponse = await RegisterHttp();

    if (bufferRegisterResponse.code == 20200) {
      ConfirmRegisterResponse bufferConfirmRegisterResponse =
          await ShowAlertdialogConfirmRegister(bufferRegisterResponse);

      if (bufferConfirmRegisterResponse.code == 20200) {
        await ShowAlertdialogRegisterSuccesses();
        resetInput();
        this.widget.rePage(true);
      } else {
        if (bufferConfirmRegisterResponse.code == 10001) {
          ShowAlertdialogConfirmRegisterFail("เบอร์โทรศัพท์ถูกใช้ไปแล้ว");
        } else if (bufferConfirmRegisterResponse.code == 10003) {
          ShowAlertdialogConfirmRegisterFail("OTP หมดเวลา");
        } else if (bufferConfirmRegisterResponse.code == 10004) {
          ShowAlertdialogConfirmRegisterFail("รหัส OTP ไม่ถูกต้อง");
        }
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
            title: Text("เกินข้อผิดพลาด"),
            content: Text(
                "เบอร์โทรศัพท์ถูกใช้ไปแล้ว"), //${bufferRegisterResponse.message}
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
            // title: Text("successes"),
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

  Future ShowAlertdialogConfirmRegisterFail(String message) {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text("เกิดข้อผิดพลาด"),
            content: Text("${message}"),
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
