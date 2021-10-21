import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

Future<List<Uint8List>> ChangeListXFileToListByte(
    List<XFile> pickedFile) async {
  List<Uint8List> bufferImage = [];
  int len = pickedFile.length;
  for (int i = 0; i < len; i++) {
    Uint8List image = await pickedFile[i].readAsBytes();
    bufferImage.add(image);
  }
  return bufferImage;
}

Future<List<String>> ChangeListByteToBase64(List<Uint8List> bufferImage) async {
  List<String> _bufferImage = [];
  int len = bufferImage.length;
  for (int i = 0; i < len; i++) {
    String image = base64Encode(bufferImage[i]);
    _bufferImage.add(image);
  }
  return _bufferImage;
}

List<String> TextImageToListImageString({@required String textimage}) {
  return textimage.split(',');
}
