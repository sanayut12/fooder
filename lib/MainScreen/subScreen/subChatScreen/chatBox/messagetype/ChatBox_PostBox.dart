import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/FullPostScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostTrack.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetBillFooderData.dart';
import 'package:fooder/function/http/httpGetPostFeedFooderPost_shop.dart';
import 'package:fooder/function/http/httpGetPostTrack.dart';

class ChatBox_PostBox extends StatefulWidget {
  ChatBox chatBox;
  ChatBox_PostBox({@required this.chatBox});
  @override
  _ChatBox_PostBoxState createState() => _ChatBox_PostBoxState();
}

class _ChatBox_PostBoxState extends State<ChatBox_PostBox> {
  GetPostTrackResponse post_track;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPost();
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    String user_id = UserInfoManagement().User_id();
    String message = this.widget.chatBox.message;
    if (post_track == null) {
      return Container();
    } else {
      String text_menu = "";
      post_track.bufferMenu.forEach((element) {
        text_menu += "\n๐${element}";
      });

      return Container(
        margin: EdgeInsets.only(top: 1, bottom: 2),
        padding: EdgeInsets.all(5),
        constraints: BoxConstraints(maxWidth: weight_screen * 0.6),
        decoration: BoxDecoration(
            color: Colors.grey[500].withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: this.widget.chatBox.sender_id == user_id
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text("จากโพสต์\n   ${post_track.post_info.detail} \n${text_menu}"),
            TextButton(
                onPressed: () {
                  OpenFullPostScreen();
                },
                child: Text("เปิด"))
          ],
        ),
      );
    }
  }

  Future<void> GetPost() async {
    String post_id = this.widget.chatBox.message;
    GetPostTrackRequest bufferGetPostTrackRequest =
        GetPostTrackRequest(post_id: post_id);
    GetPostTrackResponse _post_track = await HttpGetPostTrack(
        bufferGetPostTrackRequest: bufferGetPostTrackRequest);
    setState(() {
      post_track = _post_track;
    });
  }

  Future<void> OpenFullPostScreen() async {
    String post_id = this.widget.chatBox.message;

    GetPostFeedFooderPostShopRequest bufferGetPostFeedFooderPostShopRequest =
        GetPostFeedFooderPostShopRequest(post_id: post_id);
    GetPostFeedFooderPostShopResponse data =
        await HttpGetPostFeedFooderPostShop(
            bufferGetPostFeedFooderPostShopRequest);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FullPostScreen(
              data: data,
            )));
  }
}
