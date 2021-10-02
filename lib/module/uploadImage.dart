import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<Uint8List> UploadImageFormGallery() async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);
  final bytes = File(pickedFile.path).readAsBytesSync();
  // String base64 = base64Encode(bytes);
  return bytes;
  // Uint8List _binary = base64Decode(base64);
}

Future<String> UploadImageFormCamera() async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.camera);
  final bytes = File(pickedFile.path).readAsBytesSync();
  String base64 = base64Encode(bytes);
  return base64;
  // Uint8List _binary = base64Decode(base64);
}
