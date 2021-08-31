import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

Future<PositionGPS> locatePositionGPS() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      // return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      // return;
    }
  }

  _locationData = await location.getLocation();
  return PositionGPS(
      latitude: _locationData.latitude, longtitude: _locationData.longitude);
  // setState(() {
  //   latitude = ;
  //   longtitude = ;
  // });

  // print(" latitude : $latitude ,longtitude : $longtitude");
}

class PositionGPS {
  final double latitude, longtitude;
  PositionGPS({@required this.latitude, @required this.longtitude});
}
