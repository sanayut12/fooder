import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/Feed_BoxComponent.dart';
import 'package:fooder/MainScreen/subScreen/subFeedScreen/postBoxComponent.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderInit.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostFeedFooderPostShop.dart';
import 'package:fooder/function/dataManagement/dataPositionNow.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetPostFeedFooderInit.dart';
import 'package:fooder/function/http/httpGetPostFeedFooderPost_shop.dart';

class FeedScreen extends StatefulWidget {
  String language;
  FeedScreen({@required this.language});
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Map<String, GetPostFeedFooderPostShopResponse> bufferData = {};
  bool check_addItem = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("init");
    getPostID();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("---------------------------feed screen -----------------");
  }

  @override
  Widget build(BuildContext context) {
    // print("ความยาว ${bufferPostShop.length}");
    double widget_screen = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                // color: Colors.white,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xfffa897b), Colors.white])),
                child: ListView.builder(
                    itemCount: bufferData.length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Feed_BoxComponent();
                      } else if (bufferData.length == index - 1) {
                        return SizedBox(
                          height: 100,
                        );
                      } else {
                        String post_id = bufferData.keys.toList()[index - 1];
                        return PostBoxComponent(
                          data: bufferData[post_id],
                          PopUpAddItemToBasket: this.PopUpAddItemToBasket,
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
        Expanded(
            child: AnimatedContainer(
          height: double.infinity,
          width: double.infinity,
          duration: Duration(seconds: 2),
          alignment: Alignment.center,
          child: check_addItem
              ? Container(
                  height: widget_screen * 0.2,
                  width: widget_screen * 0.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[500].withOpacity(0.5),
                  ),
                  child: Text(
                    "เพิ่มสินค้าลงตะกร้าสำเร็จ",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Container(),
        ))
      ],
    );
  }

  Future getPostID() async {
    DataPositionNow position = PositionNow().value();
    // PositionGPS positionGPS = await locatePositionGPS();
    print("load post from shop");
    String user_id = await UserInfoManagement().User_id();

    GetPostFeedFooderRequestInit bufferGetPostFoodFooderRequestInit =
        GetPostFeedFooderRequestInit(
            user_id: user_id,
            latitude: position.latitude,
            longtitude: position.longtitude); //longitude  อย่าลืมแก้ เขียนผิด

    GetPostFeedFooderResponseInit bufferGetPostFoodFooderResponseInit =
        await HttpGetPostFeedFooderInit(bufferGetPostFoodFooderRequestInit);

    Map<String, GetPostFeedFooderPostShopResponse> _bufferData = {};
    for (int key
        in bufferGetPostFoodFooderResponseInit.bufferIDFeed.keys.toList()) {
      BufferIDFeed idFeed =
          bufferGetPostFoodFooderResponseInit.bufferIDFeed[key];
      String post_id = idFeed.post_id;

      GetPostFeedFooderPostShopRequest bufferGetPostFeedFooderPostShopRequest =
          GetPostFeedFooderPostShopRequest(post_id: post_id);
      GetPostFeedFooderPostShopResponse
          bufferGetPostFeedFooderPostShopResponse =
          await HttpGetPostFeedFooderPostShop(
              bufferGetPostFeedFooderPostShopRequest);
      _bufferData[post_id] = bufferGetPostFeedFooderPostShopResponse;
    }
    setState(() {
      bufferData = _bufferData;
    });
  }

  Future PopUpAddItemToBasket() async {
    setState(() {
      check_addItem = true;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      check_addItem = false;
    });
  }
}

  // Future<void> getFeedPost() async {
    // GetPostFeedFooderPostShopRequest bufferGetPostFeedFooderPostShopRequest =
    //     GetPostFeedFooderPostShopRequest(post_id: this.widget.post_id);
    // GetPostFeedFooderPostShopResponse bufferGetPostFeedFooderPostShopResponse =
    //     await HttpGetPostFeedFooderPostShop(
    //         bufferGetPostFeedFooderPostShopRequest);

  //   setState(() {
  //     data = bufferGetPostFeedFooderPostShopResponse;
  //   });
  // }