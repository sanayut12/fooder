import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subChatListScreen/ChatList_AppbarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subChatListScreen/ChatList_BoxComponent.dart';
import 'package:fooder/provider/DataManagementProvider.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfffa897b),
        child: SafeArea(
            child: Column(
          children: [
            ChatList_AppbarComponent(),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xfffa897b), Colors.white])),
                child: Consumer(builder:
                    (context, DataManagementProvider provider, Widget child) {
                  List<String> chatsort = provider.ChatSort;

                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: chatsort.length,
                        itemBuilder: (BuildContext context, int index) {
                          String chatmanager_id = chatsort[index];
                          return ChatList_BoxComponent(
                              chatmanager_id: chatmanager_id);
                        }),
                    // child: Text("${chatsort.length}"),
                  );
                }),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
