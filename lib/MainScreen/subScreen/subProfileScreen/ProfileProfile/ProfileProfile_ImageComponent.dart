import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectUploadImageProfile.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpUploadImageProfile.dart';
import 'package:fooder/module/uploadImage.dart';

class ProfileProfile_ImageComponent extends StatefulWidget {
  @override
  _ProfileProfile_ImageComponentState createState() =>
      _ProfileProfile_ImageComponentState();
}

class _ProfileProfile_ImageComponentState
    extends State<ProfileProfile_ImageComponent> {
  Uint8List image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      image = UserInfoManagement().Image();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return GestureDetector(
        onTap: () async {
          await UploadImage();
        },
        child: Container(
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 0.3,
          margin: EdgeInsets.only(
              left: 10, top: MediaQuery.of(context).size.width * 0.25),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () async {
          await UploadImage();
        },
        child: Container(
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 0.3,
          margin: EdgeInsets.only(
              left: 10, top: MediaQuery.of(context).size.width * 0.25),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: MemoryImage(image))),
        ),
      );
    }
  }

  Future<void> UploadImage() async {
    Uint8List _image = await UploadImageFormGallery();
    print(_image);
    if (_image == null) {
    } else {
      setState(() {
        image = _image;
      });

      String _images = base64Encode(_image);
      String user_id = UserInfoManagement().User_id();
      UploadImageProfileRequest bufferUploadImageProfileRequest =
          UploadImageProfileRequest(user_id: user_id, image: _images);
      UploadImageProfileResponse bufferUploadImageProfileResponse =
          await HttpUploadImageProfile(bufferUploadImageProfileRequest);

      if (bufferUploadImageProfileResponse.code == "20200") {
        UserInfoManagement().UpdateImage(_image);
      }
    }
  }
}
