import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/storageFunction.dart';

UserInfo userInfo;

class UserInfoManagement {
  //ใช้ทำการ เก็บข้อมูลของ user ลงใน Local storage ชื่อ 'userInfo'
  Future<void> InsertUserInfoToStorage(
      {@required UserInfo bufferUserInfo}) async {
    userInfo = bufferUserInfo;

    Map<String, dynamic> dataJson = {
      "user_id": bufferUserInfo.user_id,
      "name": bufferUserInfo.name,
      "phone": bufferUserInfo.phone,
      "email": bufferUserInfo.email,
      "image": bufferUserInfo.image
    };
    String buffer = await json.encode(dataJson);
    await InsertDataToStorage(key: 'userInfo', buffer: buffer);
  }

  //ทำการนำข้อมมูลจาก local storage ชื่อ 'userInfo' แล้วไป update ที่ตัวแปร userInfo ของ class นี้
  Future<void> init() async {
    String dataString = await ReadDataInStorage(key: 'userInfo');
    var dataJson = await json.decode(dataString);

    UserInfo bufferUserInfo = UserInfo(
        user_id: dataJson['user_id'],
        name: dataJson['name'],
        phone: dataJson['phone'],
        email: dataJson['email'],
        image: dataJson['image']);
    userInfo = bufferUserInfo;
  }

  String User_id() {
    return userInfo.user_id;
  }

  String Name() {
    return userInfo.name;
  }

  String Phone() {
    return userInfo.phone;
  }

  String Email() {
    return userInfo.email;
  }

  String Image() {
    return userInfo.image;
  }
}

class UserInfo {
  final String user_id;
  final String name;
  final String phone;
  final String email;
  final String image;

  UserInfo({this.user_id, this.name, this.phone, this.email, this.image});
}

// class DataUserInfo(){
//   final
// }
