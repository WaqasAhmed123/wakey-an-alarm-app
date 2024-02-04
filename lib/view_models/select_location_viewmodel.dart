import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/user_model.dart';

class SelectLocationViewModel extends ChangeNotifier {
  final Completer<GoogleMapController> controllerCompleter = Completer();

  LatLng? currentLocation = UserModel.currentLocation;
  final Set<Marker> markers = {}; // Set to store markers on the map
  addTempMarker({point}) {
    markers.clear(); // Clear existing markers
    markers.add(
      Marker(
        markerId: const MarkerId('selected_location'),
        position: point,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ),
      ),
    );
    notifyListeners();
  }
}
