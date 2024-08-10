import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMapView extends StatefulWidget{
  @override
  _GoogleMapViewState createState() =>_GoogleMapViewState();
}
class _GoogleMapViewState extends State<GoogleMapView> {

  final Completer<GoogleMapController> _controller= Completer();

  static final CameraPosition _kGooglePlex=
  CameraPosition(
    target:  LatLng(33.4500138, 36.1593040),
    zoom: 14.4746,
  );

  //Method to go from first camera to the second
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }

  //The Markers
  static const Marker _kGooglePlexMarker=
  Marker(
    markerId:MarkerId("روضة البنفسج"),
    infoWindow: InfoWindow(title:"روضة البنفسج" ),
    icon: BitmapDescriptor.defaultMarker,
    position:  LatLng(33.4500138, 36.1593040),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:  GoogleMap(
              mapType: MapType.normal,
              markers: {
                _kGooglePlexMarker,
              },
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}