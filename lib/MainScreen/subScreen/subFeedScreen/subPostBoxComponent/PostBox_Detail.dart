import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_Detail extends StatefulWidget {
  final DataPost_PostBox dataPost_PostBox;
  PostBox_Detail({@required this.dataPost_PostBox});
  @override
  _PostBox_DetailState createState() => _PostBox_DetailState();
}

class _PostBox_DetailState extends State<PostBox_Detail> {
  @override
  Widget build(BuildContext context) {
    return this.widget.dataPost_PostBox.detail == ""
        ? Container()
        : Container(
            // height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(5),
            child: Text("${this.widget.dataPost_PostBox.detail}"),
          );
  }
}
