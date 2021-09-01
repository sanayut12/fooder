import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/CreateAddressUserScreen.dart';
import 'package:fooder/MainScreen/subScreen/SelectAddressScreen.dart';
// import 'package:fooder/function/ClassObjects/httpObjectGetAllAddress.dart';
import 'package:fooder/function/dataManagement/dataAddressUser.dart';
// import 'package:fooder/function/dataManagement/dataUserInfo.dart';
// import 'package:fooder/function/http/httpGetAllAddress.dart';

class PreviewConfirmItem_SelectAddressComponent extends StatefulWidget {
  final Function SetAddressSelect;
  PreviewConfirmItem_SelectAddressComponent({@required this.SetAddressSelect});
  // final String how_send;

  @override
  _PreviewConfirmItem_SelectAddressComponentState createState() =>
      _PreviewConfirmItem_SelectAddressComponentState();
}

class _PreviewConfirmItem_SelectAddressComponentState
    extends State<PreviewConfirmItem_SelectAddressComponent> {
  Map<String, DataAddressUser> address_select;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget OpenAddressUser = GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => CreateAddressUserScreen()));
      },
      child: Container(
        // height: 100,

        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),

        child: Text("เพิ่มที่อยู่"),
      ),
    );

    Widget OpenSelectAddressUser = GestureDetector(
      onTap: () async {
        Map<String, DataAddressUser> _address_select =
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => SelectAddressScreen()));
        if (_address_select != null) {
          setState(() {
            address_select = _address_select;
          });
          this.widget.SetAddressSelect(_address_select.keys.toList()[0]);
        }
      },
      child: Container(
        // height: 100,
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Text("เลือกที่อยู่"),
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("เลือกที่อยู่การจัดส่ง"),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: address_select == null
                        ? Text("")
                        : Text(
                            '${address_select[address_select.keys.toList()[0]].ToString()}'),
                  ),
                ),
                Expanded(
                    child: Container(
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        child: OpenSelectAddressUser,
                      )),
                      Expanded(
                          child: Container(
                        child: OpenAddressUser,
                      ))
                    ],
                  ),
                ))
                // Expanded(
                //   child: Column(
                //     children: [
                //       Column(
                //         children: [
                //           Expanded(child: OpenSelectAddressUser),
                //           Expanded(child: OpenAddressUser),
                //         ],
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
