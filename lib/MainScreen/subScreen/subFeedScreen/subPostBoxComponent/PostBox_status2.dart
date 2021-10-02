import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/dataHow_SendBox.dart';
import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';

class PostBox_StatusBar2 extends StatefulWidget {
  String language;
  final DataPost_PostBox dataPost_PostBox;
  PostBox_StatusBar2(
      {@required this.language, @required this.dataPost_PostBox});
  @override
  _PostBox_StatusBar2State createState() => _PostBox_StatusBar2State();
}

class _PostBox_StatusBar2State extends State<PostBox_StatusBar2> {
  @override
  Widget build(BuildContext context) {
    LanguageManagement lgm = LanguageManagement();
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "${lgm.value('038', this.widget.language)} : ${HowSendText(this.widget.dataPost_PostBox.how_send, this.widget.language)}"),
          Text(
              "${lgm.value('041', this.widget.language)} : ${this.widget.dataPost_PostBox.stop.ToString()}"),
          Text(
              "${lgm.value('038', this.widget.language)} : ${this.widget.dataPost_PostBox.send.ToString()}"),
        ],
      ),
    );
  }
}
