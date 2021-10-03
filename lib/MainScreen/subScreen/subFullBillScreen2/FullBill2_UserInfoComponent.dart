import 'package:flutter/cupertino.dart';
import 'package:fooder/function/ClassObjects/httpObjectGetBillFooderData.dart';
import 'package:fooder/function/dataManagement/dataAddressUser.dart';
import 'package:fooder/function/dataManagement/dataUserInfo.dart';

class FullBill2_UserInfoComponent extends StatefulWidget {
  GetBillFooderDataResponse data;
  FullBill2_UserInfoComponent({@required this.data});
  @override
  _FullBill2_UserInfoComponentState createState() =>
      _FullBill2_UserInfoComponentState();
}

class _FullBill2_UserInfoComponentState
    extends State<FullBill2_UserInfoComponent> {
  @override
  Widget build(BuildContext context) {
    String how_send = this.widget.data.bill.how_send;

    if (how_send == "1") {
      String address_user_id = this.widget.data.bill.address_user_id;
      DataAddressUser address_users =
          this.widget.data.bufferAddress[address_user_id];
      return Container(
        child: Column(
          children: [Text("${address_users.ToString()}")],
        ),
      );
    } else {
      Widget UsersInfo = Container(
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(UserInfoManagement().Image()))),
            ),
            Text("${UserInfoManagement().Name()}")
          ],
        ),
      );
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("รับที่ร้าน"), UsersInfo],
        ),
      );
    }
  }
}
