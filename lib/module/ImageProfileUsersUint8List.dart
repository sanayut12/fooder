import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class ImageProfileUsersUint8List extends StatefulWidget {
  Uint8List image;
  ImageProfileUsersUint8List({@required this.image});
  @override
  _ImageProfileUsersUint8ListState createState() =>
      _ImageProfileUsersUint8ListState();
}

class _ImageProfileUsersUint8ListState
    extends State<ImageProfileUsersUint8List> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: MemoryImage(this.widget.image))),
    );
  }
}
