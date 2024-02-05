// // ignore_for_file: must_call_super

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:wakey/services/location_service.dart';
// import 'package:wakey/view_models/select_location_viewmodel.dart';

// import '../models/user_model.dart';

// // class SelectLocationView extends StatefulWidget {
// //   const SelectLocationView({super.key});

// //   @override
// //   State<SelectLocationView> createState() => _SelectLocationViewState();
// // }

// class SelectLocationView extends StatefulWidget {
//   const SelectLocationView({Key? key}) : super(key: key);

//   @override
//   _SelectLocationViewState createState() => _SelectLocationViewState();
// }

// class _SelectLocationViewState extends State<SelectLocationView> {
//   // final Completer<GoogleMapController> _controllerCompleter = Completer();

//   @override
//   Widget build(BuildContext context) {
//     final selectLocationViewModel =
//         Provider.of<SelectLocationViewModel>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Select Location'),
//       ),
//       body: GoogleMap(
//         // onMapCreated: (GoogleMapController controller) {
//         //   selectLocationViewModel.controllerCompleter.complete(controller);
//         // },
//         // onCameraMove: (CameraPosition position) {
//         //   selectLocationViewModel.currentLocation = position.target;
//         // },
//          onLongPress: (LatLng point) {
//           // Handle the long-press event here
//           print('Long Pressed: $point');

//           // You can update your ViewModel or perform any other action with the LatLng
//           // selectLocationViewModel.updateLocation(point);
//         },
//         myLocationButtonEnabled: true,
//         myLocationEnabled: true,
//         initialCameraPosition: CameraPosition(
//           target:
//               selectLocationViewModel.currentLocation ?? const LatLng(0.0, 0.0),
//           zoom: 15.0,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'; // Add this import for geocoding
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wakey/view_models/select_location_viewmodel.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({Key? key}) : super(key: key);

  @override
  _SelectLocationViewState createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  // final Set<Marker> _markers = {}; // Set to store markers on the map

  @override
  Widget build(BuildContext context) {
    final selectLocationViewModel =
        Provider.of<SelectLocationViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Location'),
      ),
      body: Stack(children: [
        Consumer<SelectLocationViewModel>(builder: (context, value, child) {
          return GoogleMap(
            onMapCreated: (GoogleMapController controller) {},
            onLongPress: (LatLng point) async {
              // Handle the long-press event here
              print('Long Pressed: $point');
              selectLocationViewModel.addTempMarker(point: point);
              // Add a red temporary marker
              // _markers.clear(); // Clear existing markers
              // _markers.add(
              //   Marker(
              //     markerId: const MarkerId('selected_location'),
              //     position: point,
              //     icon: BitmapDescriptor.defaultMarkerWithHue(
              //       BitmapDescriptor.hueRed,
              //     ),
              //   ),
              // );

              // Reverse geocode to get the address information
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  point.latitude, point.longitude);
              Placemark place = placemarks[0];

              // Show bottom sheet with location info
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Selected Location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text('Address: ${place.name}'),
                          Text('City: ${place.locality}'),
                          Text('State: ${place.administrativeArea}'),
                          Text('Country: ${place.country}'),
                        ],
                      ));
                },
              ).whenComplete(() {
                selectLocationViewModel.removeTempMarker();
              });

            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: selectLocationViewModel.currentLocation ??
                  const LatLng(0.0, 0.0),
              zoom: 15.0,
            ),
            markers: selectLocationViewModel.markers,
          );
        })
      ]),
    );
  }
}
