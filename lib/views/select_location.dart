import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wakey/view_models/select_location_viewmodel.dart';
import 'package:wakey/view_models/set_alarm_viewmodel.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({super.key});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controllerCompleter = Completer();

    final selectLocationViewModel =
        Provider.of<SelectLocationViewModel>(context, listen: false);
    return Stack(children: [
      Consumer<SelectLocationViewModel>(builder: (context, value, child) {
        return GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              controllerCompleter.complete(controller);
            },
            onCameraMove: (CameraPosition position) {
              // Update the selected location based on the camera position
             selectLocationViewModel.selectedLocation = position.target;
            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: const CameraPosition(
              // target: LatLng(37.783333, -12 2.416667), // Default location
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
// SelectLocationViewWidget({context}) {
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
