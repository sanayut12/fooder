import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooder/MainScreen/subScreen/subPinPositionScreen/PinPosition_OptionComponent.dart';
import 'package:fooder/function/dataManagement/getGPS.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinPositionScreen extends StatefulWidget {
  final double latitude, longtitude;
  PinPositionScreen({@required this.latitude, @required this.longtitude});
  @override
  _PinPositionScreenState createState() => _PinPositionScreenState();
}

class _PinPositionScreenState extends State<PinPositionScreen> {
  double latitude, longtitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckNull();
  }

  @override
  Widget build(BuildContext context) {
    Widget ShowMap = latitude == null
        ? Container()
        : GoogleMap(
            cameraTargetBounds: CameraTargetBounds.unbounded,
            mapType: MapType.hybrid,
            onCameraMove: (position) => {PinMark(position: position)},
            markers: <Marker>[
              Marker(
                markerId: MarkerId("value"),
                position: LatLng(latitude, longtitude),
                // infoWindow: InfoWindow(title: "ddsdd", anchor: Offset(0.5, 0)),
              )
            ].toSet(),
            initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longtitude), zoom: 17.5));
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          children: [
            Expanded(child: ShowMap),
            PinPosition_OptionComponent(
                latitude: latitude, longtitude: longtitude)
          ],
        ),
      ),
    );
  }

  Future<void> PinMark({@required CameraPosition position}) {
    print("${position.target.latitude} ${position.target.longitude}");
    setState(() {
      latitude = position.target.latitude;
      longtitude = position.target.longitude;
    });
  }

  Future<void> CheckNull() async {
    if (this.widget.latitude == null) {
      PositionGPS positionGPS = await locatePositionGPS();
      setState(() {
        latitude = positionGPS.latitude;
        longtitude = positionGPS.longtitude;
      });
    } else {
      setState(() {
        latitude = this.widget.latitude;
        longtitude = this.widget.longtitude;
      });
    }
  }
}
