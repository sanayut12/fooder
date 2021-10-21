import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subWritePostScreen/WritePost_AppBarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subWritePostScreen/WritePost_BottomBarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subWritePostScreen/WritePost_InputTextComponent.dart';
import 'package:fooder/MainScreen/subScreen/subWritePostScreen/WritePost_ListImageComponent.dart';
import 'package:fooder/MainScreen/subScreen/subWritePostScreen/WritePost_MiniProfileComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectWritePostUsers.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpWritePostUsers.dart';
import 'package:fooder/module/imageProcressing.dart';
import 'package:fooder/module/uploadImage.dart';

class WritePostScreen extends StatefulWidget {
  @override
  _WritePostScreenState createState() => _WritePostScreenState();
}

class _WritePostScreenState extends State<WritePostScreen> {
  bool load = false;
  bool successes = false;
  String message = "";
  List<Uint8List> bufferImage = [];
  double latitude, longtitude;
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  WritePost_AppBarComponent(),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView(
                        children: [
                          WritePost_MiniProfileComponent(),
                          WritePost_InputTextComponent(
                              message: message, fun: SetMessage),
                          // SizedBox(
                          //   height: 2500,
                          // ),
                          WritePost_ListImageComponent(
                              bufferImage: bufferImage, fun: null),
                        ],
                      ),
                    ),
                  ),
                  WritePost_BottomBarComponent(
                    UploadImage: UploadImage,
                    OnPost: OnPost,
                  )
                ],
              ),
              load
                  ? Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: double.infinity,
                      width: double.infinity,
                    ),
              successes
                  ? Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Container(
                        height: weight_screen * 0.25,
                        width: weight_screen * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFFFA897B)),
                        alignment: Alignment.center,
                        child: Text(
                          "โพสต์สำเร็จ",
                          style: TextStyle(
                              fontSize: 20, fontFamily: "SukhumvitSet-Bold"),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        )),
      ),
    );
  }

  Future<void> SetMessage(String _message) {
    message = _message;
  }

  Future<void> UploadImage() async {
    List<Uint8List> _bufferImage = await UploadMultipleImage();
    _bufferImage.forEach((element) {
      setState(() {
        bufferImage.add(element);
      });
    });
  }

  Future<void> OnPost() async {
    print("ffddddddddddddddddddd");
    setState(() {
      load = true;
    });
    String user_id = UserInfoManagement().User_id();
    List<String> _bufferImage = await ChangeListByteToBase64(bufferImage);
    WritePostUsersRequest bufferWritePostUsersRequest = WritePostUsersRequest(
        user_id: user_id,
        message: message,
        bufferImages: _bufferImage,
        latitude: latitude,
        longtitude: longtitude);
    WritePostUsersResponse bufferWritePostUsersResponse =
        await HttpWritePostUsers(
            bufferWritePostUsersRequest: bufferWritePostUsersRequest);
    setState(() {
      load = false;
    });

    if (bufferWritePostUsersResponse.code == "20200") {
      setState(() {
        successes = true;
      });

      await Future.delayed(Duration(seconds: 1));
      Navigator.of(context).pop();
    } else {}
  }
}
