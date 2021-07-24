import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/component/postBox.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderInit.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:fooder/function/http/httpGetPostFeedFooderInit.dart';
import 'package:fooder/function/http/httpGetPostFeedFooderPost_shop.dart';
import 'package:geolocator/geolocator.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // Map<String, DataShopInfo> bufferDataShopInfo = new Map();
  var bufferPostShop = <Map<String, DataPost>>[];
  Map<String, DataShopInfo> bufferDataShopInfo = {};
  // Map<String, DataPost> bufferPostShop ={};

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
    print("ความยาว ${bufferPostShop.length}");
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey[100],
      child: ListView.builder(
          itemCount: bufferPostShop.length,
          itemBuilder: (context, int index) {
            // print("$index");

            String post_id = bufferPostShop[index]
                .keys
                .single; // .keys.sigle เป็นการดึงเอา key ออกมาจาก map และ sigle เป็นการดึงแค่key ล้วนๆออกมา เพราะ .keys จะติด datatype<string >

            return PostBoxComPonent(
              dataPost: bufferPostShop[index],
              dataShopInfo:
                  bufferDataShopInfo[bufferPostShop[index][post_id].shop_id],
            );
          }),
    );
  }

  Future getPostID() async {
    print("load post from shop");
    String user_id = await UserInfoManagement().User_id();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    GetPostFoodFooderRequestInit bufferGetPostFoodFooderRequestInit =
        GetPostFoodFooderRequestInit(
            user_id: user_id,
            latitude: position.latitude,
            longtitude: position.longitude); //longitude  อย่าลืมแก้ เขียนผิด

    GetPostFoodFooderResponseInit bufferGetPostFoodFooderResponseInit =
        await HttpGetPostFeedFooderInit(bufferGetPostFoodFooderRequestInit);

    buffer_post_id = bufferGetPostFoodFooderResponseInit.bufferIDFeed;
    print(buffer_post_id);
    print(bufferGetPostFoodFooderResponseInit.length());

    print("ความยาวโพสต์ ${bufferPostShop.length}");
    //เช็คว่ามี id ของ โพสต์
    if (bufferGetPostFoodFooderResponseInit.length() == 0) {
    } else {
      // buffer_post_id.forEach((key, value) async {
      buffer_post_id.forEach((key, value) async {
        String post_id = value.id;
        // print("sss : ${key}");
        await LoadPostDataByID(post_id, key);
      });
      // String post_id = buffer_post_id[0].id;

      // });
    }
  }

  //function ในการเฟชข้อมูลจากเซิร์ฟเวอร์ที่ละโพสต์โดยใช้ id และทำการ updateข้อมูลไปยังตัวแปร  bufferPostShop และ bufferDataShopInfo
  Future<void> LoadPostDataByID(String post_id, int key) async {
    GetPostFoodFooderPostShopRequest bufferGetPostFoodFooderPostShopRequest =
        GetPostFoodFooderPostShopRequest(post_id: post_id);
    GetPostFoodFooderPostShopResponse bufferGetPostFoodFooderPostShopResponse =
        await HttpGetPostFeedFooderPostShop(
            bufferGetPostFoodFooderPostShopRequest);

    String shop_id =
        bufferGetPostFoodFooderPostShopResponse.bufferDataShopInfo.keys.first;
    DataShopInfo dataShopInfo =
        bufferGetPostFoodFooderPostShopResponse.bufferDataShopInfo[shop_id];

    DataPost dataPost =
        bufferGetPostFoodFooderPostShopResponse.bufferDataPost[post_id];
    bufferDataShopInfo[shop_id] = dataShopInfo;
    Map<String, DataPost> bufferDataPost = {post_id: dataPost};
    setState(() {
      bufferPostShop.add(bufferDataPost);
    });
    print("number : ${key}");
  }
}
