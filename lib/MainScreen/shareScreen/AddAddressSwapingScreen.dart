import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/shareScreen/addAddressScreen.dart';
import 'package:fooder/MainScreen/shareScreen/addPositionScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectAddAddress.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/http/httpAddAddress.dart';

class AddAddressSwapingScreen extends StatefulWidget {
  @override
  _AddAddressSwapingScreenState createState() =>
      _AddAddressSwapingScreenState();
}

class _AddAddressSwapingScreenState extends State<AddAddressSwapingScreen> {
  String phone, address, sub_district, district, province;
  double latitude, longtitude;
  int page_index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = GestureDetector(
      onTap: () {
        Navigator.of(context).pop(0);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.red),
        child: Text("ยกเลิก"),
      ),
    );

    Widget backButton = GestureDetector(
      onTap: () {
        setState(() {
          page_index = 0;
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.red),
        child: Text("ย้อนกลับ"),
      ),
    );

    Widget nextButton = GestureDetector(
      onTap: () {
        setState(() {
          page_index = 1;
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.red),
        child: Text("ต่อไป"),
      ),
    );
    Widget finishButton = GestureDetector(
      onTap: () {
        print(
            "$phone $address $province $district $sub_district $latitude $longtitude");
        uploadDataLocation();
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.red),
        child: Text("เสร็จสิ้น"),
      ),
    );

    Widget BottomBarPage1 = Container(
      child: Row(
        children: [Expanded(child: cancelButton), Expanded(child: nextButton)],
      ),
    );
    Widget BottomBarPage2 = Container(
      child: Row(
        children: [
          Expanded(child: cancelButton),
          Expanded(child: backButton),
          Expanded(child: finishButton)
        ],
      ),
    );

    List<Widget> BottomBar = <Widget>[BottomBarPage1, BottomBarPage2];
    List<Widget> Page_Swipping = <Widget>[
      AddAddressScreen(set_data: setstate_From_AddAddress),
      AddPositionScreen(
        set_dataposition: setstate_Form_AddPosition,
      )
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              flex: 8,
              child: Page_Swipping[page_index]), //Page_Swipping[page_index]
          Expanded(flex: 1, child: BottomBar[page_index])
        ],
      ),
    );
  }

  Future setstate_From_AddAddress(String _phone, String _address,
      String _province, String _district, String _sub_district) {
    setState(() {
      phone = _phone;
      address = _address;
      province = _province;
      district = _district;
      sub_district = _sub_district;
    });
  }

  Future setstate_Form_AddPosition(double _latitude, double _longtitude) {
    setState(() {
      latitude = _latitude;
      longtitude = _longtitude;
    });
  }

  Future uploadDataLocation() async {
    String user_id = UserInfoManagement().User_id();
    AddAddressRequest bufferAddAddressRequest = AddAddressRequest(
        user_id: user_id,
        phone: phone,
        address: address,
        sub_district: sub_district,
        district: district,
        province: province,
        latitude: latitude,
        longtitude: longtitude);

    AddAddressResponse bufferAddAddressResponse =
        await HttpAddAddress(bufferAddAddressRequest);
    print(bufferAddAddressResponse.code);
    if (bufferAddAddressResponse.code == "20200") {
      showCard();
    }
  }

  Future showCard() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("อัพโหลดข้อมูลสำเร็จ"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(1);
                  },
                  child: Text("ตกลง"))
            ],
          );
        });
  }
}
