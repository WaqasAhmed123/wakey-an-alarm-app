import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wakey/models/user_model.dart';
import 'package:wakey/services/database_service.dart';

class LocationService {
  static fetchCurrentLocation() async {
    bool locationGranted = await requestLocationPermission();

    if (locationGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        UserModel.currentLocation =
            LatLng(position.latitude, position.longitude);
        debugPrint("${UserModel.currentLocation}");
      } catch (e) {}
    }
  }

  static requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

}
