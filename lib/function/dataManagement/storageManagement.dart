// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:shopder/ClassObjects/httpObjectLogin.dart';

// import './storageFunction.dart';

// //เพิ่มข้อมมูล ของ user ลงไปที่ local storage
// Future<void> InsertUserInfoToStorage(
//     {@required DataUserInfo bufferUserInfo}) async {
//   Map<String, dynamic> dataJson = {
//     "user_id": bufferUserInfo.user_id,
//     "name": bufferUserInfo.name,
//     "phone": bufferUserInfo.phone,
//     "email": bufferUserInfo.email
//   };
//   // print('$dataJson');
//   String buffer = await json.encode(dataJson);
//   InsertDataToStorage(key: 'userInfo', buffer: buffer);
// }

// Future<DataUserInfo> ReadDataUserInfoInStorage() async {
//   String dataString = await ReadDataInStorage(key: 'userInfo');
//   // print("===================== $dataString");
//   var dataJson = await json.decode(dataString);
//   DataUserInfo userInfo = DataUserInfo(
//       user_id: dataJson['user_id'],
//       name: dataJson['name'],
//       phone: dataJson['phone'],
//       email: dataJson['email']);
//   return userInfo;
// }
