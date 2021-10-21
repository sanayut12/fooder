import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/PinPositionScreen.dart';
import 'package:fooder/MainScreen/subScreen/subCreateAddressUserScreen/CreateAddressUser_InputComponent.dart';
import 'package:fooder/MainScreen/subScreen/subCreateAddressUserScreen/CreateAddressUser_OptionBarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subCreateAddressUserScreen/CreateAddressUser_SelectAddressComponent.dart';
import 'package:fooder/MainScreen/subScreen/subCreateAddressUserScreen/CreateAddressUser_appbarComponent.dart';
import 'package:fooder/MainScreen/subScreen/subPinPositionScreen/PinPosition_MiniMapComponent.dart';
import 'package:fooder/function/dataManagement/getGPS.dart';

class CreateAddressUserScreen extends StatefulWidget {
  @override
  _CreateAddressUserScreenState createState() =>
      _CreateAddressUserScreenState();
}

class _CreateAddressUserScreenState extends State<CreateAddressUserScreen> {
  //ข้อมูลที่อยู่ไม่ได้เข้ารหัส
  String name = "",
      phone = "",
      address = "",
      no = "",
      moo = "",
      baan = "",
      road = "",
      soy = "";
  //
  String sub_district, district, province;
  double latitude, longtitude;
  int active = 0;
  @override
  Widget build(BuildContext context) {
    Widget mapShow = GestureDetector(
      onTap: () {
        OpenPinPositionScreen();
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(bottom: 50),
        color: Colors.red,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0, -0.9),
                  end: Alignment(0, -0.5),
                  colors: [Color(0xfffa897b), Colors.white])),
          child: Column(
            children: [
              CreateAddressUser_appbarComponent(),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView(
                    children: [
                      CreateAddressUser_InputComponent(
                          name: name,
                          phone: phone,
                          address: address,
                          no: no,
                          moo: moo,
                          baan: baan,
                          road: road,
                          soy: soy,
                          setData: setData),
                      CreateAddressUser_SelectAddressComponent(
                          sub_district: sub_district,
                          district: district,
                          province: province,
                          SetAddress: SetAddress),
                      Column(
                        children: [
                          latitude == null
                              ? GestureDetector(
                                  onTap: () {
                                    OpenPinPositionScreen();
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width * 0.9,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFFDC9c2),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("คลิกเพื่อทำการปักหมุด"),
                                  ),
                                )
                              : PinPosition_MiniMapComponent(
                                  latitude: latitude,
                                  longtitude: longtitude,
                                  OpenPinPositionScreen: OpenPinPositionScreen)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              CreateAddressUser_OptionBarComponent(
                name: name,
                phone: phone,
                address: address,
                no: no,
                moo: moo,
                baan: baan,
                road: road,
                soy: soy,
                sub_district: sub_district,
                district: district,
                province: province,
                latitude: latitude,
                longtitude: longtitude,
                active: active,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setData(String _name, String _phone, String _address, String _no,
      String _moo, String _baan, String _road, String _soy) {
    print(
        "${_name} ${_phone} ${_address} ${_no} ${_moo} ${_baan} ${_road} ${_soy} ");
    setState(() {
      if (_name != null) {
        setState(() {
          name = _name;
        });
      } else if (_phone != null) {
        setState(() {
          phone = _phone;
        });
      } else if (_address != null) {
        setState(() {
          address = _address;
        });
      } else if (_no != null) {
        setState(() {
          no = _no;
        });
      } else if (_moo != null) {
        setState(() {
          moo = _moo;
        });
      } else if (_baan != null) {
        setState(() {
          baan = _baan;
        });
      } else if (_road != null) {
        setState(() {
          road = _road;
        });
      } else if (_soy != null) {
        setState(() {
          soy = _soy;
        });
      }
    });
    SetActive();
  }

  Future<void> SetAddress(
      String _sub_district, String _district, String _province) {
    // print(object)
    setState(() {
      sub_district = _sub_district;
      district = _district;
      province = _province;
    });
    SetActive();
  }

  Future<void> OpenPinPositionScreen() async {
    PositionGPS positionGPS = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return PinPositionScreen(
        latitude: latitude,
        longtitude: longtitude,
      );
    }));
    if (positionGPS == null) {
    } else {
      setState(() {
        latitude = null;
        longtitude = null;
      });
      await Future.delayed(Duration(milliseconds: 10));

      setState(() {
        latitude = positionGPS.latitude;
        longtitude = positionGPS.longtitude;
      });
      await Future.delayed(Duration(milliseconds: 10));
    }
    SetActive();
  }

  Future<void> SetActive() {
    if (name != "" &&
        phone.length == 10 &&
        province != null &&
        district != null &&
        sub_district != null &&
        latitude != null &&
        longtitude != null) {
      setState(() {
        active = 1;
      });
    } else {
      setState(() {
        active = 0;
      });
    }
  }
}
