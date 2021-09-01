import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAllAddress.dart';
import 'package:fooder/function/dataManagement/dataAddressUser.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpGetAllAddress.dart';

class SelectAddressScreen extends StatefulWidget {
  @override
  _SelectAddressScreenState createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  Map<String, DataAddressUser> bufferDataAddressUser;
  List<String> bufferAddress_user_id = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpGetAllAddress();
  }

  @override
  Widget build(BuildContext context) {
    Widget ShowAddressUser(String address_user_id, String text) =>
        GestureDetector(
          onTap: () {
            Map<String, DataAddressUser> data = {
              "${address_user_id}": bufferDataAddressUser[address_user_id]
            };
            CallBackData(data);
          },
          child: Container(
            height: MediaQuery.of(context).size.width * 0.25,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Text("${text}"),
          ),
        );

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red,
          child: ListView.builder(
              itemCount: bufferAddress_user_id.length,
              itemBuilder: (BuildContext context, int index) {
                String address_user_id = bufferAddress_user_id[index];
                String text = bufferDataAddressUser[address_user_id].ToString();
                return ShowAddressUser(address_user_id, text);
              })),
    );
  }

  Future<void> httpGetAllAddress() async {
    String user_id = UserInfoManagement().User_id();
    GetAllAddressRequest bufferGetAllAddressRequest =
        GetAllAddressRequest(user_id: user_id);
    GetAllAddressResponse bufferGetAllAddressResponse =
        await HttpGetAllAddress(bufferGetAllAddressRequest);
    setState(() {
      bufferAddress_user_id =
          bufferGetAllAddressResponse.bufferDataAddressUser.keys.toList();
      bufferDataAddressUser = bufferGetAllAddressResponse.bufferDataAddressUser;
    });
  }

  Future<void> CallBackData(Map<String, DataAddressUser> data) {
    Navigator.of(context).pop(data);
  }
}
