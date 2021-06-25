import 'package:flutter/material.dart';
import 'package:fooder/ClassObjects/httpObjectGetPostFeedFooder.dart';
import 'package:fooder/MainScreen/component/postBox.dart';
import 'package:fooder/function/dataManagement/dataListShopInfo.dart';
import 'package:fooder/function/dataManagement/dataPostBox.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/dateBox.dart';
import 'package:fooder/function/http/httpGetPostFeedFooder.dart';
import 'package:geolocator/geolocator.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Map<String, DataShopInfo> bufferDataShopInfo = new Map();
  var bufferPostShop = <Map<String, DataPost>>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
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

  Future getPost() async {
    String user_id = await UserInfoManagement().User_id();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var dateNow = DateTime.now();
    dateNow.day;

    DateBox date_now = await DateBox(
        year: dateNow.year,
        month: dateNow.month,
        day: dateNow.day,
        hour: dateNow.hour,
        min: dateNow.minute,
        sec: dateNow.second);
    GetPostFoodFooderRequest bufferGetPostFoodFooderRequest =
        GetPostFoodFooderRequest(
      user_id: user_id,
      latitude: position.latitude,
      longtitude: position.longitude,
      date_now: date_now,
    );
    GetPostFoodFooderResponse bufferGetPostFoodFooderResponse =
        await HttpGetPostFeedFooder(bufferGetPostFoodFooderRequest);

    //ทำการนำข้อมูลของ ร้านค้าไปเก็บไว้ในตัวแปร  bufferDataShopInfo จัดเก็บแบบ map or dic
    bufferGetPostFoodFooderResponse.bufferDataShopInfo.forEach((key, value) {
      // print(key);
      bufferDataShopInfo[key] = value;
    });

    //ทำการนำข้อมูล โพสต์ของร้านค้าไปเก็บที่ตัวแปร bufferPostShop  จัดเก็บแบบ list ภายในมี ดาต้า สตรัคเจอแบบ map <string , datapost>

    bufferGetPostFoodFooderResponse.bufferDataPost.forEach((key, value) {
      Map<String, DataPost> _buffer = {key: value};
      setState(() {
        bufferPostShop.add(_buffer);
      });
    });
  }
}
