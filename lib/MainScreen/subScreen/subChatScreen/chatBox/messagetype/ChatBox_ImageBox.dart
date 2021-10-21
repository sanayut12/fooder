import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:fooder/function/dataManagement/dataChatBox.dart';
import 'package:image_picker/image_picker.dart';

class ChatBox_ImageBox extends StatefulWidget {
  ChatBox chatBox;
  ChatBox_ImageBox({@required this.chatBox});
  @override
  _ChatBox_ImageBoxState createState() => _ChatBox_ImageBoxState();
}

class _ChatBox_ImageBoxState extends State<ChatBox_ImageBox> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    String message = this.widget.chatBox.message;
    List<String> bufferImage = message.split(',');
    if (bufferImage.length == 1) {
      return ShowImage1(bufferImage: bufferImage);
    } else if (bufferImage.length == 2) {
      return ShowImage2(bufferImage: bufferImage);
    } else if (bufferImage.length == 3) {
      return ShowImage3(bufferImage: bufferImage);
    } else if (bufferImage.length == 4) {
      return ShowImage4(bufferImage: bufferImage);
    } else if (bufferImage.length == 5) {
      return ShowImage5(bufferImage: bufferImage);
    } else if (bufferImage.length == 6) {
      return ShowImage6(bufferImage: bufferImage);
    } else {
      return Container();
    }
  }
}

class ShowImage1 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage1({@required this.bufferImage});
  @override
  _ShowImage1State createState() => _ShowImage1State();
}

class _ShowImage1State extends State<ShowImage1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image = this.widget.bufferImage[0];
    return ImageBoxS1(image: image);
  }
}

class ShowImage2 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage2({@required this.bufferImage});
  @override
  _ShowImage2State createState() => _ShowImage2State();
}

class _ShowImage2State extends State<ShowImage2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image1 = this.widget.bufferImage[0];
    String image2 = this.widget.bufferImage[1];
    return Row(
      children: [
        ImageBoxS2(image: image1),
        ImageBoxS2(image: image2),
      ],
    );
  }
}

class ShowImage3 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage3({@required this.bufferImage});
  @override
  _ShowImage3State createState() => _ShowImage3State();
}

class _ShowImage3State extends State<ShowImage3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image1 = this.widget.bufferImage[0];
    String image2 = this.widget.bufferImage[1];
    String image3 = this.widget.bufferImage[2];
    return Row(
      children: [
        ImageBoxS3(image: image1),
        ImageBoxS3(image: image2),
        ImageBoxS3(image: image3),
      ],
    );
  }
}

class ShowImage4 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage4({@required this.bufferImage});
  @override
  _ShowImage4State createState() => _ShowImage4State();
}

class _ShowImage4State extends State<ShowImage4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image1 = this.widget.bufferImage[0];
    String image2 = this.widget.bufferImage[1];
    String image3 = this.widget.bufferImage[2];
    String image4 = this.widget.bufferImage[3];
    return Column(
      children: [
        Row(
          children: [ImageBoxS4(image: image1), ImageBoxS4(image: image2)],
        ),
        Row(
          children: [ImageBoxS4(image: image3), ImageBoxS4(image: image4)],
        ),
      ],
    );
  }
}

class ShowImage5 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage5({@required this.bufferImage});
  @override
  _ShowImage5State createState() => _ShowImage5State();
}

class _ShowImage5State extends State<ShowImage5> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image1 = this.widget.bufferImage[0];
    String image2 = this.widget.bufferImage[1];
    String image3 = this.widget.bufferImage[2];
    String image4 = this.widget.bufferImage[3];
    String image5 = this.widget.bufferImage[4];
    return Column(
      children: [
        Row(
          children: [ImageBoxS4(image: image1), ImageBoxS4(image: image2)],
        ),
        Row(
          children: [ImageBoxS4(image: image3), ImageBoxS4(image: image4)],
        ),
        Row(
          children: [
            SizedBox(
              width: 60,
            ),
            ImageBoxS4(image: image5)
          ],
        ),
      ],
    );
  }
}

class ShowImage6 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage6({@required this.bufferImage});
  @override
  _ShowImage6State createState() => _ShowImage6State();
}

class _ShowImage6State extends State<ShowImage6> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image1 = this.widget.bufferImage[0];
    String image2 = this.widget.bufferImage[1];
    String image3 = this.widget.bufferImage[2];
    String image4 = this.widget.bufferImage[3];
    String image5 = this.widget.bufferImage[4];
    String image6 = this.widget.bufferImage[5];
    return Column(
      children: [
        Row(
          children: [
            ImageBoxS3(image: image1),
            ImageBoxS3(image: image2),
            ImageBoxS3(image: image3)
          ],
        ),
        Row(
          children: [
            ImageBoxS3(image: image4),
            ImageBoxS3(image: image5),
            ImageBoxS3(image: image6)
          ],
        ),
      ],
    );
  }
}

class ShowImage7 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage7({@required this.bufferImage});
  @override
  _ShowImage7State createState() => _ShowImage7State();
}

class _ShowImage7State extends State<ShowImage7> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image = this.widget.bufferImage[0];
    return Container(
      height: 240,
      width: 120,
      margin: EdgeInsets.only(top: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/chatImage/${image}"))),
    );
  }
}

class ShowImage8 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage8({@required this.bufferImage});
  @override
  _ShowImage8State createState() => _ShowImage8State();
}

class _ShowImage8State extends State<ShowImage8> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image = this.widget.bufferImage[0];
    return Container(
      height: 240,
      width: 120,
      margin: EdgeInsets.only(top: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/chatImage/${image}"))),
    );
  }
}

class ShowImage9 extends StatefulWidget {
  List<String> bufferImage;
  ShowImage9({@required this.bufferImage});
  @override
  _ShowImage9State createState() => _ShowImage9State();
}

class _ShowImage9State extends State<ShowImage9> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image = this.widget.bufferImage[0];
    return Container(
      height: 240,
      width: 120,
      margin: EdgeInsets.only(top: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/chatImage/${image}"))),
    );
  }
}

class ImageBoxS1 extends StatefulWidget {
  String image;
  ImageBoxS1({@required this.image});

  @override
  _ImageBoxS1State createState() => _ImageBoxS1State();
}

class _ImageBoxS1State extends State<ImageBoxS1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 120,
      margin: EdgeInsets.only(top: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/chatImage/${this.widget.image}"))),
    );
  }
}

class ImageBoxS2 extends StatefulWidget {
  String image;
  ImageBoxS2({@required this.image});

  @override
  _ImageBoxS2State createState() => _ImageBoxS2State();
}

class _ImageBoxS2State extends State<ImageBoxS2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 60,
      margin: EdgeInsets.only(top: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/chatImage/${this.widget.image}"))),
    );
  }
}

class ImageBoxS3 extends StatefulWidget {
  String image;
  ImageBoxS3({@required this.image});

  @override
  _ImageBoxS3State createState() => _ImageBoxS3State();
}

class _ImageBoxS3State extends State<ImageBoxS3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(top: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/chatImage/${this.widget.image}"))),
    );
  }
}

class ImageBoxS4 extends StatefulWidget {
  String image;
  ImageBoxS4({@required this.image});

  @override
  _ImageBoxS4State createState() => _ImageBoxS4State();
}

class _ImageBoxS4State extends State<ImageBoxS4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.only(top: 4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/chatImage/${this.widget.image}"))),
    );
  }
}
