import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetPostUsers_Data.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';

class PostUsers_ShowImageComponent extends StatefulWidget {
  GetPostUsers_PostInfo data;
  PostUsers_ShowImageComponent({@required this.data});
  @override
  _PostUsers_ShowImageComponentState createState() =>
      _PostUsers_ShowImageComponentState();
}

class _PostUsers_ShowImageComponentState
    extends State<PostUsers_ShowImageComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    GetPostUsers_PostInfo data = this.widget.data;
    if (data.bufferImage.length == 0) {
      return Container();
    } else {
      return Container(
        height: weight_screen * 0.9,
        width: weight_screen * 0.9,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.bufferImage.length,
            itemBuilder: (BuildContext context, int index) {
              String image = data.bufferImage[index];
              return ShowImagePostUsers(image: image);
            }),
      );
    }
  }
}

class ShowImagePostUsers extends StatefulWidget {
  String image;
  ShowImagePostUsers({@required this.image});
  @override
  _ShowImagePostUsersState createState() => _ShowImagePostUsersState();
}

class _ShowImagePostUsersState extends State<ShowImagePostUsers> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      height: weight_screen * 0.9,
      width: weight_screen * 0.9,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.image}"))),
    );
  }
}
