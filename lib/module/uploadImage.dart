import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:fooder/module/imageProcressing.dart';
import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();
Future<Uint8List> UploadImageFormGallery() async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);
  final bytes = File(pickedFile.path).readAsBytesSync();
  // String base64 = base64Encode(bytes);
  return bytes;
  // Uint8List _binary = base64Decode(base64);
}

Future<String> UploadImageFormCamera() async {
  final pickedFile = await picker.getImage(source: ImageSource.camera);
  final bytes = File(pickedFile.path).readAsBytesSync();
  String base64 = base64Encode(bytes);
  return base64;
  // Uint8List _binary = base64Decode(base64);
}

Future<List<Uint8List>> UploadMultipleImage() async {
  final pickedFile = await picker.pickMultiImage();

  if (pickedFile.length == 0) {
    return null;
  } else {
    List<Uint8List> bufferimage = await ChangeListXFileToListByte(pickedFile);
    return bufferimage;
  }
  // var buffer = pickedFile.map((e) async => await e.readAsBytes()).toList();
  // final bytes = File(pickedFile.path).readAsBytesSync();
  // String base64 = base64Encode(bytes);
  // return base64;
  // Uint8List _binary = base64Decode(base64);
}
