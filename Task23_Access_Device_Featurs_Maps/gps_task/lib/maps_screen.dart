// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => MapSampleState();
}

class MapSampleState extends State<MapsScreen> {
  late CameraPosition myPosition;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('cairo'),
      position: LatLng(30.033333, 31.233334),
      infoWindow: InfoWindow(title: "Cairo"),
    ),
  };

  static const CameraPosition cairoPosition = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Google Map"),
      ),
      body: GoogleMap(
        markers: _markers,
        mapType: MapType.hybrid,
        initialCameraPosition: cairoPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMyLocation,
        label: const Text('To My Location'),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  // Moves the camera to the user's current location
  Future<void> _goToMyLocation() async {
    await _determinePosition();
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(myPosition));
  }

//****please not this part is not required in the task.****

  // Determines the user location and updates the map
  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please Enable Location Services")));
    }

    // Checking location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Please Change allow app permision to access location services.")));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // Fetching the current position
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Loading....")));

      Position geoPositon = await Geolocator.getCurrentPosition();
      myPosition = CameraPosition(
        target: LatLng(geoPositon.latitude, geoPositon.longitude),
        zoom: 14.4746,
      );
      // Adding a marker for the user's current location
      _markers.add(Marker(
        markerId: MarkerId("myLocation"),
        position: LatLng(geoPositon.latitude, geoPositon.longitude),
        infoWindow: InfoWindow(title: "My Location"),
      ));
      setState(() {});
    }
  }
}
