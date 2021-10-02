import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'package:fooder/MainScreen/mainScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectLogin.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpLogin.dart';

String phone = "0998765432";
String password = "12345";

class LoginScreen extends StatefulWidget {
  String language;
  LoginScreen({@required this.language});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phone, _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phone = TextEditingController(text: phone);
    _password = TextEditingController(text: password);
  }

  @override
  Widget build(BuildContext context) {
    LanguageManagement lgm = LanguageManagement();
    Widget PhoneInput = TextFormField(
      controller: _phone,
      onChanged: (e) {
        setState(() {
          phone = e;
        });
      },
      decoration: InputDecoration(
          hintText: "${lgm.value('003', this.widget.language)}",
          hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget PasswordInput = TextFormField(
      controller: _password,
      onChanged: (e) {
        setState(() {
          password = e;
        });
      },
      decoration: InputDecoration(
          hintText: "${lgm.value('004', this.widget.language)}",
          hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget ButtonLogin = GestureDetector(
      onTap: () {
        OnpressLogin();
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 100,
        child: Text(
          "${lgm.value('001', this.widget.language)}",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );

    // Widget FacebookLogin = FacebookAuthButton(
    //   onPressed: () {},
    //   style: AuthButtonStyle.icon,
    // );
    // Widget GoogleLogin = GoogleAuthButton(
    //   onPressed: () {},
    //   style: AuthButtonStyle.icon,
    //   iconStyle: AuthIconStyle.secondary,
    // );

    Widget LoginFrom = Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            children: [PhoneInput, PasswordInput, ButtonLogin],
          ),
        ),
        // Container(
        //   height: 200,
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [FacebookLogin, GoogleLogin],
        //       )
        //     ],
        //   ),
        // ),
      ],
    ));
    return Container(
        height: 400,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: LoginFrom);
  }

  Future OnpressLogin() {
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
            content: Text("เบอร์โทรศัพท์ หรือ รหัสผ่านไม่ถ฿กต้อง"),
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
