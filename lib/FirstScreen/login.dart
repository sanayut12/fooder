import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:fooder/FirstScreen/subLogin/Login_ButtonLoginComponent.dart';
import 'package:fooder/FirstScreen/subLogin/Login_PasswordUsersInputComponent.dart';
import 'package:fooder/FirstScreen/subLogin/Login_PhoneUsersInputComponent.dart';

import 'package:fooder/MainScreen/mainScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectLogin.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpLogin.dart';

// String phone = "0998765432";
// String password = "12345";

class LoginScreen extends StatefulWidget {
  String language;
  LoginScreen({@required this.language});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phone = "";
  String password = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              Login_PhoneUsersInputComponent(phone: phone, fun: SetPhone),
              Login_PasswordUsersInputComponent(
                  password: password, fun: SetPassword),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Login_ButtonLoginComponent(fun: OnpressLogin)))
            ],
          ),
        ));
  }

  Future<void> SetPhone(String _phone) {
    setState(() {
      phone = _phone;
    });
  }

  Future<void> SetPassword(String _password) {
    print(_password);
    setState(() {
      password = _password;
    });
  }

  Future OnpressLogin() {
    // print("${phone} \n ${password}");
    LoginHttp();
  }

  Future LoginHttp() async {
    //ทำการ fetch ไปยัง server เพื่อ login
    LoginRequest bufferLoginRequest =
        LoginRequest(phone: phone, password: password);
    LoginResponse bufferLoginResponse = await HttpLogin(bufferLoginRequest);

    //เมื่อมีการ login สำเร็จ
    if (bufferLoginResponse.code == 20200) {
      UserInfo bufferUserInfo = UserInfo(
          user_id: bufferLoginResponse.userInfo.user_id,
          name: bufferLoginResponse.userInfo.name,
          phone: bufferLoginResponse.userInfo.phone,
          email: bufferLoginResponse.userInfo.email,
          image: bufferLoginResponse.userInfo.image);
      FlutterBackgroundService().sendData({
        "event": "start_service_push_notification",
        "user_id": "${bufferLoginResponse.userInfo.user_id}"
      });
      UserInfoManagement()
          .InsertUserInfoToStorage(bufferUserInfo: bufferUserInfo);
      Navigator.of(context).pushNamed(MainScreen.routeName);
    } else if (bufferLoginResponse.code == 10004) {
      //เมื่อ login ไม่าำเร็จ
      AlertLoginFail();
    }
  }

  Future<void> AlertLoginFail() {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text('แจ้งเตือน'),
            content: Text("เบอร์โทรศัพท์ หรือ รหัสผ่านไม่ถูกต้อง"),
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
