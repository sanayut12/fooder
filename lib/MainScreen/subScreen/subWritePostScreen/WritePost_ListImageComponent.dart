import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class WritePost_ListImageComponent extends StatefulWidget {
  List<Uint8List> bufferImage;
  final Function fun;
  WritePost_ListImageComponent(
      {@required this.bufferImage, @required this.fun});
  @override
  _WritePost_ListImageComponentState createState() =>
      _WritePost_ListImageComponentState();
}

class _WritePost_ListImageComponentState
    extends State<WritePost_ListImageComponent> {
  @override
  Widget build(BuildContext context) {
    List<Uint8List> bufferIamge = this.widget.bufferImage;
    List<Widget> buffer = [];
    bufferIamge.forEach((element) {
      buffer.add(ShowImage(image: element));
    });
    return Container(
      width: double.infinity,
      child: Column(
        children: buffer,
      ),
    );
  }
}

class ShowImage extends StatefulWidget {
  Uint8List image;
  ShowImage({@required this.image});
  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    Uint8List image = this.widget.image;
    if (image == null) {
      return Container();
    } else {
      return Container(
        height: weight_screen * 0.9,
        width: weight_screen * 0.9,
        decoration:
            BoxDecoration(image: DecorationImage(image: MemoryImage(image))),
      );
    }
  }
}
