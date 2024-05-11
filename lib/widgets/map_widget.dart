import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../theme/theme.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    this.name = "",
    this.description = "",
    this.category = "",
    this.labels = "",
    this.imageUrl = "",
    this.qrCodeUrl = "",
    this.isFound = false,
  }) : super(key: key);
  final String name;
  final String description;
  final String category;
  final String labels;
  final String imageUrl;
  final String qrCodeUrl;
  final bool isFound;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  late CameraPosition _currentLocation;
  void getPermissions() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    print("\n\n _locationData \n\n");
    print(_locationData);

    _currentLocation = CameraPosition(
      target: LatLng(
          _locationData.latitude as double, _locationData.longitude as double),
      zoom: 14.4746,
    );
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  LatLng? selectedLocation; // Variable to store the selected location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().surfaceContainerLow,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 7, 185, 239)),
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Report Missing Item',
          style:
              TextStyle(fontSize: 20, color: Color.fromARGB(255, 7, 185, 239)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (LatLng location) {
              setState(() {
                selectedLocation = location;
              });
            },
            markers: Set<Marker>.from([
              if (selectedLocation != null)
                Marker(
                  markerId: const MarkerId('selected_location'),
                  position: selectedLocation!,
                ),
            ]),
          ),
          if (selectedLocation != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _goToSelectedLocation,
                      child: const Text('Select Location'),
                    ),
                    const SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: _confirmLocation,
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _goToSelectedLocation() async {
    final GoogleMapController controller = await _controller.future;
    if (selectedLocation != null) {
      final CameraPosition selectedCameraPosition = CameraPosition(
        target: selectedLocation!,
        zoom: 18,
      );
      controller.animateCamera(
          CameraUpdate.newCameraPosition(selectedCameraPosition));
    } else {
      // No location selected, handle accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No location selected')),
      );
    }
  }

  void _confirmLocation() {
    if (selectedLocation != null) {
      Navigator.of(context).pop();
      // Navigate to a new screen passing the selected location
      // widget.isFound
      //     ? Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => FoundDetails(
      //             locationData: selectedLocation,
      //             name: widget.name,
      //             description: widget.description,
      //             labels: widget.labels,
      //             category: widget.category,
      //             imageUrl: widget.imageUrl,
      //           ),
      //         ),
      //       )
      //     : Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => IncidentDetails(
      //               locationData: selectedLocation,
      //               name: widget.name,
      //               description: widget.description,
      //               labels: widget.labels,
      //               category: widget.category,
      //               imageUrl: widget.imageUrl,
      //               qrCodeUrl: widget.qrCodeUrl),
      //         ),
      //       );
    } else {
      // No location selected, handle accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No location selected')),
      );
    }
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentLocation));
  }
}
