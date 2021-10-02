import 'dart:convert';
import 'dart:typed_data';

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
  Future<bool> init() async {
    String dataString = await ReadDataInStorage(key: 'userInfo');

    if (dataString == null) {
      return false;
    } else {
      var dataJson = await json.decode(dataString);
      List _image = dataJson['image'];
      if (_image == null) {
        UserInfo bufferUserInfo = UserInfo(
            user_id: dataJson['user_id'],
            name: dataJson['name'],
            phone: dataJson['phone'],
            email: dataJson['email'],
            image: null);
        userInfo = bufferUserInfo;
      } else {
        Uint8List image = new Uint8List(_image.length);

        for (int i = 0; i < _image.length; i++) {
          image[i] = _image[i];
        }
        UserInfo bufferUserInfo = UserInfo(
            user_id: dataJson['user_id'],
            name: dataJson['name'],
            phone: dataJson['phone'],
            email: dataJson['email'],
            image: image);
        userInfo = bufferUserInfo;
      }

      return true;
    }
  }

  Future<bool> DeleteUser() async {
    bool status = await DeleteDataInLocalStorage(key: "userInfo");
    return status;
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

  Uint8List Image() {
    return userInfo.image;
  }

  Future<void> UpdateImage(Uint8List _image) {
    userInfo.image = _image;
  }
}

class UserInfo {
  final String user_id;
  String name;
  String phone;
  String email;
  Uint8List image;

  UserInfo({this.user_id, this.name, this.phone, this.email, this.image});
}

// class DataUserInfo(){
//   final
// }
