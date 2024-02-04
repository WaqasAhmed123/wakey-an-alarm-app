import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/user_model.dart';

class SelectLocationViewModel extends ChangeNotifier {
  final Completer<GoogleMapController> controllerCompleter = Completer();

  LatLng? currentLocation = UserModel.currentLocation;
}
