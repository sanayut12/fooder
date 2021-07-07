import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddPositionScreen extends StatefulWidget {
  final Function set_dataposition;
  AddPositionScreen({@required this.set_dataposition});
  @override
  _AddPositionScreenState createState() => _AddPositionScreenState();
}

class _AddPositionScreenState extends State<AddPositionScreen> {
  double _latitude, _longtitude;
  Future Set_DataPosition() {
    this.widget.set_dataposition(_latitude, _longtitude);
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _latitude = position.latitude;
      _longtitude = position.longitude;
    });
    Set_DataPosition();
    print(" latitude : $_latitude ,longtitude : $_longtitude");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locatePosition();
  }

  @override
  Future<void> PinMark({@required CameraPosition position}) {
    setState(() {
      _latitude = position.target.latitude;
      _longtitude = position.target.longitude;
    });
    Set_DataPosition();
    print("$_latitude $_longtitude");
  }

  Marker mark;
  Widget build(BuildContext context) {
    if (_latitude != null) {
      mark = Marker(
        markerId: MarkerId("value"),
        position: LatLng(_latitude, _longtitude),
        // infoWindow: InfoWindow(title: "ddsdd", anchor: Offset(0.5, 0)),
      );
    }

    return _latitude == null
        ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.amber,
          )
        : GoogleMap(
            cameraTargetBounds: CameraTargetBounds.unbounded,
            mapType: MapType.hybrid,
            onCameraMove: (position) => {PinMark(position: position)},
            markers: <Marker>[
              mark,
            ].toSet(),
            initialCameraPosition: CameraPosition(
                target: LatLng(_latitude, _longtitude), zoom: 17.5));
  }
}
