import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/listimage/ChatBox_BillComponent.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/listimage/ChatBox_ListImageComponent.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/listimage/ChatBox_MenuComponent.dart';
import 'package:fooder/MainScreen/subScreen/subChatScreen/chatBox/listimage/ChatBox_PostComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectChatCenter.dart';
import 'package:fooder/function/ClassObjects/httpObjectChatCenterImage.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillTrack.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetMenuTrack.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostTrack.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpChatCenter.dart';
import 'package:fooder/function/http/httpChatCenterImage.dart';
import 'package:fooder/function/http/httpGetBillTrack.dart';
import 'package:fooder/function/http/httpGetMenuTrack.dart';
import 'package:fooder/function/http/httpGetPostTrack.dart';
import 'package:fooder/module/imageProcressing.dart';
import 'package:fooder/module/uploadImage.dart';

class Chat_BottomComponent extends StatefulWidget {
  String chatmanager_id, shop_id, type_chat, message;

  Chat_BottomComponent(
      {@required this.chatmanager_id,
      @required this.shop_id,
      this.type_chat,
      this.message});
  @override
  _Chat_BottomComponentState createState() => _Chat_BottomComponentState();
}

class _Chat_BottomComponentState extends State<Chat_BottomComponent> {
  String message = "";
  List<Uint8List> bufferImage = [];
  GetPostTrackResponse post_track;
  GetMenuTrackResponse menu_track;
  GetBillTrackResponse bill_track;

  ScrollController controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InitTrack();
  }

  @override
  Widget build(BuildContext context) {
    Widget ShowListImage = bufferImage.length == 0
        ? Container()
        : ChatBox_ListImageComponent(
            bufferImage: bufferImage,
            controller: controller,
            fun: DeleteImage,
          );
    Widget ShopPostMini = post_track == null
        ? Container()
        : ChatBox_PostComponent(
            post_track: post_track,
            fun: DeletePostTrack,
          );

    Widget MenuMini = menu_track == null
        ? Container()
        : ChatBox_MenuComponent(menu_track: menu_track);
    Widget BillMini = bill_track == null
        ? Container()
        : ChatBox_BillComponent(bill_track: bill_track);
    // Widget SendButton
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowListImage,
        ShopPostMini,
        BillMini,
        MenuMini,
        Container(
          // height: 55,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              post_track != null || menu_track != null || bill_track != null
                  ? Container(
                      width: 55,
                    )
                  : ButtonModel(
                      icon: Icons.image,
                      fun: GetImageFromGallery,
                    ),
              post_track != null || menu_track != null || bill_track != null
                  ? Container(
                      width: 55,
                    )
                  : ButtonModel(
                      icon: Icons.more_vert_outlined,
                      fun: null,
                    ),
              Expanded(
                  child: post_track != null ||
                          menu_track != null ||
                          bill_track != null ||
                          bufferImage.length != 0
                      ? GestureDetector(
                          onTap: () {
                            DeletePostTrack();
                          },
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("ยกเลิก"),
                          ))
                      : InputMessage(
                          message: message,
                          SetMessage: SetMessage,
                        )),
              // TextFormField()
              ButtonModel(
                icon: Icons.send,
                fun: OnpressSend,
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> DeletePostTrack() {
    setState(() {
      bufferImage = [];
      post_track = null;
      menu_track = null;
      bill_track = null;
    });
  }

  Future<void> InitTrack() async {
    bufferImage = [];
    post_track = null;
    menu_track = null;
    bill_track = null;

    //"4" แทรกสินค้า // "5" แทรกโพสต์ //. "6" แทรกบิล
    if (this.widget.type_chat == "5") {
      print("post post post");
      GetPostTrackRequest bufferGetPostTrackRequest =
          GetPostTrackRequest(post_id: this.widget.message);
      GetPostTrackResponse _post_track = await HttpGetPostTrack(
          bufferGetPostTrackRequest: bufferGetPostTrackRequest);
      setState(() {
        post_track = _post_track;
      });
    } else if (this.widget.type_chat == "4") {
      print("menu menu menu");
      GetMenuTrackRequest bufferGetMenuTrackRequest =
          GetMenuTrackRequest(inventory_id: this.widget.message);
      GetMenuTrackResponse _menu_track = await HttpGetMenuTrack(
          bufferGetMenuTrackRequest: bufferGetMenuTrackRequest);
      setState(() {
        menu_track = _menu_track;
      });
    } else if (this.widget.type_chat == "6") {
      print("bill bill bill");
      GetBillTrackRequest bufferGetBillTrackRequest =
          GetBillTrackRequest(bill_id: this.widget.message);
      GetBillTrackResponse _bill_track = await HttpGetBillTrack(
          bufferGetBillTrackRequest: bufferGetBillTrackRequest);
      setState(() {
        bill_track = _bill_track;
      });
    }
  }

  Future<void> GetImageFromGallery() async {
    List<Uint8List> _bufferImage = await UploadMultipleImage();
    for (int i = 0; i < _bufferImage.length; i++) {
      if (bufferImage.length <= 9) {
        setState(() {
          bufferImage.add(_bufferImage[i]);
        });
      }
    }
    await Future.delayed(Duration(milliseconds: 50));
    controller.jumpTo(controller.position.maxScrollExtent);
  }

  Future<void> DeleteImage(int index) {
    bufferImage.removeAt(index);
    setState(() {
      bufferImage;
    });
  }

  Future<void> SetMessage(String _message) {
    message = _message;
    // print(message);
  }

  Future<void> OnpressSend() async {
    String chatmanager_id = this.widget.chatmanager_id;
    String user_id = UserInfoManagement().User_id();
    String shop_id = this.widget.shop_id;
    String _message = message;

    //ส่งรูปภาพ
    if (bufferImage.isNotEmpty) {
      List<String> bufferImageString =
          await ChangeListByteToBase64(bufferImage);
      setState(() {
        bufferImage = [];
      });
      ChatCenterImageRequest bufferChatCenterImageRequest =
          ChatCenterImageRequest(
              chatmanager_id: chatmanager_id,
              user_id: user_id,
              shop_id: shop_id,
              sender_id: user_id,
              message: bufferImageString,
              type_chat: "3");
      HttpChatCenterImage(
          bufferChatCenterImageRequest: bufferChatCenterImageRequest);
    } else if (post_track != null || menu_track != null || bill_track != null) {
      setState(() {
        message = "";
        post_track = null;
        menu_track = null;
        bill_track = null;
      });
      ChatCenterRequest dataSend = ChatCenterRequest(
          chatmanager_id: chatmanager_id,
          sender_id: user_id,
          user_id: user_id,
          shop_id: shop_id,
          message: this.widget.message,
          type_chat: this.widget.type_chat); //type_chat ="1" ส่งข้อความ
      ChatCenterResponse bufferChatCenterResponse =
          await HttpChatCenter(bufferChatCenterRequest: dataSend);
    } else {
      setState(() {
        message = "";
      });
      ChatCenterRequest dataSend = ChatCenterRequest(
          chatmanager_id: chatmanager_id,
          sender_id: user_id,
          user_id: user_id,
          shop_id: shop_id,
          message: _message,
          type_chat: "1"); //type_chat ="1" ส่งข้อความ
      ChatCenterResponse bufferChatCenterResponse =
          await HttpChatCenter(bufferChatCenterRequest: dataSend);
    }
  }
}

///////////////////////////////////////////////////////////////////////////////
class ButtonModel extends StatefulWidget {
  IconData icon;
  Function fun;
  ButtonModel({@required this.icon, @required this.fun});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.grey[300].withOpacity(0.5);
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Colors.white;
        });

        this.widget.fun();
        // await Future.delayed(Duration(milliseconds: 50));
      },
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Icon(
          this.widget.icon,
          size: 40,
          color: Color(0xfffa897b),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
class InputMessage extends StatefulWidget {
  String message;
  final Function SetMessage;
  InputMessage({@required this.message, @required this.SetMessage});
  @override
  _InputMessageState createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: TextEditingController(text: this.widget.message),
        onChanged: (e) {
          this.widget.SetMessage(e);
        },
        cursorHeight: 20,
        maxLines: 5,
        minLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: -10),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.purple,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
