import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/shareScreen/AddAddressSwapingScreen.dart';
import 'package:fooder/MainScreen/shareScreen/addAddressScreen.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetAllAddress.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';
import 'package:fooder/function/dataManagement/readJsonAddress.dart';
import 'package:fooder/function/http/httpGetAllAddress.dart';

class SelectAddressComponent extends StatefulWidget {
  final Function set_address_user_id;

  SelectAddressComponent({@required this.set_address_user_id});
  @override
  _SelectAddressComponentState createState() => _SelectAddressComponentState();
}

class _SelectAddressComponentState extends State<SelectAddressComponent> {
  List<int> bufferKeyAddress = [];
  List<Widget> bufferAddress = <Widget>[];
  Map<int, AddressBox> bufferAddressBox;
  int AddressSelect;
  AddressThailand addressThailand = AddressThailand();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllAddress();
  }

  @override
  Widget build(BuildContext context) {
    //ปุ่มที่กดเพิ่มที่อยู่การจัดส่วสินค้า
    Widget addAddressBar = Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.only(right: 10),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          GoToAddAddressScreen();
        },
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: Text("เพิ่มที่อยู่"),
        ),
      ),
    );
    Widget SElectAddress = Container(
        height: 200,
        width: double.infinity,
        color: Colors.red,
        alignment: Alignment.center,
        child: AddressSelect == null
            ? GestureDetector(
                onTap: () async {
                  int _AddressSelect = await ListAddressFormDialog();
                  print(_AddressSelect);
                  this.widget.set_address_user_id(
                      bufferAddressBox[_AddressSelect].address_user_id);
                  setState(() {
                    AddressSelect = _AddressSelect;
                  });
                },
                child: Container(
                  height: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("เลือกที่อยู่การจัดส่ง"),
                ),
              )
            : GestureDetector(
                onTap: () async {
                  int _AddressSelect = await ListAddressFormDialog();
                  print(_AddressSelect);
                  this.widget.set_address_user_id(
                      bufferAddressBox[_AddressSelect].address_user_id);
                  setState(() {
                    AddressSelect = _AddressSelect;
                  });
                },
                child: Stack(
                  children: [
                    bufferAddress[AddressSelect],
                    Container(
                      color: Colors.transparent,
                      height: 150,
                      width: double.infinity,
                    )
                  ],
                ),
              )
        // TextButton(
        //     onPressed: () async {

        //     },
        //     child: Text("data")),
        );
    return Container(
      height: 300,
      color: Colors.amber,
      child: Column(
        children: [addAddressBar, SElectAddress], //addAddressBar
      ),
    );
  }

  Future GoToAddAddressScreen() async {
    int checksuccess = await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => AddAddressSwapingScreen()));
    print("select address component $checksuccess");
  }

  Future getAllAddress() async {
    String user_id = UserInfoManagement().User_id();
    GetAllAddressRequest bufferGetAllAddressRequest =
        GetAllAddressRequest(user_id: user_id);
    GetAllAddressResponse bufferGetAllAddressResponse =
        await HttpGetAllAddress(bufferGetAllAddressRequest);
    print("${bufferGetAllAddressResponse.listkey()}");

    setState(() {
      bufferKeyAddress = bufferGetAllAddressResponse.listkey();
      bufferAddressBox = bufferGetAllAddressResponse.bufferAddressBox;
    });
    bufferKeyAddress.forEach((element) {
      //ข้อมูลที่มีการเข้ารหัส ที่อยู่ของประเทศไทย
      String provinceKey = bufferAddressBox[element].province;
      String districtKey = bufferAddressBox[element].district;
      String sub_districtKey = bufferAddressBox[element].sub_district;
      //ข้อมูลที่ไม่มีการเข้ารหัส
      String _phone = bufferAddressBox[element].phone;
      String _address = bufferAddressBox[element].address;

      String _province = addressThailand.ProvinceValue(
          provinceKey: provinceKey, language: 'th');
      String _district = addressThailand.DistrictValue(
          provinceKey: provinceKey, districtKey: districtKey, language: "th");
      String _sub_district = addressThailand.Sub_DistrictValue(
          provinceKey: provinceKey,
          districtKey: districtKey,
          sub_districtKey: sub_districtKey,
          language: 'th');
      int _post_code = addressThailand.Post_CodeValue(
          provinceKey: provinceKey,
          districtKey: districtKey,
          sub_districtKey: sub_districtKey);
      bufferAddress.add(ItemSelectAddress(element, _phone, _address,
          _sub_district, _district, _province, _post_code));
    });
  }

  Future<int> ListAddressFormDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("เลือกที่อยู่การจัดส่ง"),
            insetPadding: EdgeInsets.all(30),
            children: bufferAddress,
          );
        });
  }

  Widget ItemSelectAddress(
      @required int address_id,
      @required String _phone,
      @required String _address,
      @required String _sub_district,
      @required String _district,
      @required String _province,
      @required int _post_code) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(address_id);
      },
      child: Container(
        color: Colors.blue,
        height: 150,
        width: double.infinity,
        child: Column(
          children: [
            Text("${_phone}"),
            Text("${_address}"),
            Text("${_sub_district} ${_district} ${_province} ${_post_code}")
          ],
        ),
      ),
    );
  }
}
