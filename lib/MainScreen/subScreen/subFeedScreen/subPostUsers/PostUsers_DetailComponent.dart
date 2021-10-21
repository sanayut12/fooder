import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostUsers_Data.dart';

class PostUsers_DetailComponent extends StatefulWidget {
  GetPostUsers_PostInfo data;
  PostUsers_DetailComponent({@required this.data});
  @override
  _PostUsers_DetailComponentState createState() =>
      _PostUsers_DetailComponentState();
}

class _PostUsers_DetailComponentState extends State<PostUsers_DetailComponent> {
  @override
  Widget build(BuildContext context) {
    GetPostUsers_PostInfo data = this.widget.data;
    // print("${this.widget.data}");
    return Container(
      alignment: Alignment.topLeft,
      child: Text("${data.message}"),
    );
  }
}
