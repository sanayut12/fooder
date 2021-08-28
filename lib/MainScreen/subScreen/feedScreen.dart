import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/postBoxComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderInit.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetPostFeedFooderInit.dart';
import 'package:geolocator/geolocator.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Map<int, BufferIDFeed>
      buffer_post_id; //ที่รวม post_id เมื่อเข้ามาหน้านี้จะทำการ fetch data (post_id จาก server มาเก็บในตัวแปรนี้)

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostID();
  }

  @override
  Widget build(BuildContext context) {
    // print("ความยาว ${bufferPostShop.length}");

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey[100],
      child: ListView.builder(
          itemCount: buffer_post_id == null ? 0 : buffer_post_id.length,
          itemBuilder: (BuildContext context, int index) {
            String post_id = buffer_post_id[index].post_id;
            return PostBoxComponent(post_id: post_id);
          }),
    );
  }

  Future getPostID() async {
    print("load post from shop");
    String user_id = await UserInfoManagement().User_id();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    GetPostFeedFooderRequestInit bufferGetPostFoodFooderRequestInit =
        GetPostFeedFooderRequestInit(
            user_id: user_id,
            latitude: position.latitude,
            longtitude: position.longitude); //longitude  อย่าลืมแก้ เขียนผิด

    GetPostFeedFooderResponseInit bufferGetPostFoodFooderResponseInit =
        await HttpGetPostFeedFooderInit(bufferGetPostFoodFooderRequestInit);
    setState(() {
      buffer_post_id = bufferGetPostFoodFooderResponseInit.bufferIDFeed;
    });
  }
}
