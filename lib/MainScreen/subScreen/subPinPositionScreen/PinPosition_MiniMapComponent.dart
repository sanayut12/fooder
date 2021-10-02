import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinPosition_MiniMapComponent extends StatefulWidget {
  final double latitude, longtitude;
  final Function OpenPinPositionScreen;
  PinPosition_MiniMapComponent(
      {@required this.latitude,
      @required this.longtitude,
      @required this.OpenPinPositionScreen});
  @override
  _PinPosition_MiniMapComponentState createState() =>
      _PinPosition_MiniMapComponentState();
}

class _PinPosition_MiniMapComponentState
    extends State<PinPosition_MiniMapComponent> {
  CameraPosition cameraPosition;
  @override
  Widget build(BuildContext context) {
    // cameraPosition =;
    Widget ShowMap = this.widget.latitude == null
        ? Container()
        : GoogleMap(
            // cameraTargetBounds: CameraTargetBounds.unbounded,
            mapType: MapType.hybrid,
            markers: <Marker>[
              Marker(
                markerId: MarkerId("value"),
                position: LatLng(this.widget.latitude, this.widget.longtitude),
                // infoWindow: InfoWindow(title: "ddsdd", anchor: Offset(0.5, 0)),
              )
            ].toSet(),
            initialCameraPosition: CameraPosition(
                target: LatLng(this.widget.latitude, this.widget.longtitude),
                tilt: 30,
                bearing: 10,
                zoom: 15));
    return Container(
      height: MediaQuery.of(context).size.width * 0.9,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      margin: EdgeInsets.only(bottom: 50),
      child: Stack(
        children: [
          ShowMap,
          Column(
            children: [
              Text("${this.widget.latitude}"),
              Text("${this.widget.longtitude}")
            ],
          ),
          GestureDetector(
            onTap: () async {
              await this.widget.OpenPinPositionScreen();
              // ResetPosition();
            },
            child: Container(
              color: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
