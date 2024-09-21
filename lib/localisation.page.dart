import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final LatLng myLocation;

  MapPage({required this.myLocation});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.myLocation,
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('My Location'),
            position: widget.myLocation,
            infoWindow: InfoWindow(title: 'My Location'),
          ),
        },
      ),
    );
  }
}
