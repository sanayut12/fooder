import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritePost_BottomBarComponent extends StatefulWidget {
  final Function UploadImage;
  final Function OnPost;
  WritePost_BottomBarComponent(
      {@required this.UploadImage, @required this.OnPost});
  @override
  _WritePost_BottomBarComponentState createState() =>
      _WritePost_BottomBarComponentState();
}

class _WritePost_BottomBarComponentState
    extends State<WritePost_BottomBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget Buttom1 = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Icon(Icons.safety_divider),
      ),
    );
    Widget ButtomUploadImage = GestureDetector(
      onTap: () {
        this.widget.UploadImage();
      },
      child: Container(
        alignment: Alignment.center,
        child: Icon(Icons.image),
      ),
    );
    Widget Buttom3 = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Icon(Icons.safety_divider),
      ),
    );
    Widget ButtomPost = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            this.widget.OnPost();
          },
          child: Container(
            width: 85,
            height: 40,
            // margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFFA897B)),
            child: Text(
              "โพสต์",
              style: TextStyle(fontFamily: "SukhumvitSet-Bold"),
            ),
          ),
        )
      ],
    );
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          // Expanded(child: Buttom1),
          Expanded(child: ButtomUploadImage),
          // Expanded(child: Buttom3),
          Expanded(child: ButtomPost),
        ],
      ),
    );
  }
}
