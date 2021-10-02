import 'package:flutter/cupertino.dart';
import 'package:fooder/function/dataManagement/getGPS.dart';

DataPositionNow position;

class PositionNow {
  void init() async {
    print("loading gps");
    PositionGPS positionGPS = await locatePositionGPS();
    position = DataPositionNow(
        latitude: positionGPS.latitude, longtitude: positionGPS.longtitude);
  }

  DataPositionNow value() {
    return position;
  }
}

class DataPositionNow {
  double latitude, longtitude;
  DataPositionNow({@required this.latitude, @required this.longtitude});
}
