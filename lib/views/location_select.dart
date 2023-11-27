import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wakey/view_models/set_alarm_viewmodel.dart';

class LocationSelect extends StatefulWidget {
  const LocationSelect({super.key});

  @override
  State<LocationSelect> createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controllerCompleter = Completer();
    LatLng selectedLocation;

    final setAlarmViewModel =
        Provider.of<SetAlarmViewModel>(context, listen: false);
    return Stack(children: [
      Consumer<SetAlarmViewModel>(builder: (context, value, child) {
        return GoogleMap(
          
            onMapCreated: (GoogleMapController controller) {
              controllerCompleter.complete(controller);
            },
            onCameraMove: (CameraPosition position) {
              // Update the selected location based on the camera position
              selectedLocation = position.target;
            },
            initialCameraPosition: const CameraPosition(
              // target: LatLng(37.783333, -122.416667), // Default location
              target: LatLng(24.8950265, 67.0382493), // Default location
              // target: LatLng(setAlarmViewModel.currentLocationLat,
              //     setAlarmViewModel.currentLocationLat), // Default location
              zoom: 12.0,
            ));
      }),
      Positioned(
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Center(
            child: Icon(Icons.location_on, color: Colors.white),
          ),
        ),
      ),
    ]);
  }
}
// locationSelectWidget({context}) {
//   final Completer<GoogleMapController> controllerCompleter = Completer();
//   final setAlarmViewModel =
//       Provider.of<SetAlarmViewModel>(context, listen: false);
//   // Store the selected location coordinates
//   LatLng selectedLocation;
//   return Stack(children: [
//     Consumer<SetAlarmViewModel>(builder: (context, value, child) {
//       return GoogleMap(
//           onMapCreated: (GoogleMapController controller) {
//             controllerCompleter.complete(controller);
//           },
//           onCameraMove: (CameraPosition position) {
//             // Update the selected location based on the camera position
//             selectedLocation = position.target;
//           },
//           initialCameraPosition: CameraPosition(
//             // target: LatLng(37.783333, -122.416667), // Default location
//             target: LatLng(setAlarmViewModel.currentLocationLat,
//                 setAlarmViewModel.currentLocationLat), // Default location
//             zoom: 12.0,
//           ));
//     }),
//     Positioned(
//       child: Container(
//         width: 50.0,
//         height: 50.0,
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//         child: const Center(
//           child: Icon(Icons.location_on, color: Colors.white),
//         ),
//       ),
//     ),
//   ]);
// }
