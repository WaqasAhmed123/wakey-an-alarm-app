import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UserModel {
  _requestLocationPermission() async {
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

  // getCurrentLocation() {
  //   return {"latitude": currentLocationLat, "longitude": currentLocationLng};
  //   notifyListeners();
  // }

  late double currentLocationLat;
  late double currentLocationLng;

  getCurrentLocation() async {
    bool locationGranted = await _requestLocationPermission();

    if (locationGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        currentLocationLat = position.latitude;
        currentLocationLng = position.longitude;
        // notifyListeners();
        // currentLocation = LatLng(
        //   position.latitude,
        //   position.longitude,
        // );

        // mapController?.animateCamera(CameraUpdate.newLatLng(currentLocation));
        // UserModel.currentLocation = currentLocation;
        debugPrint("$position");
        return ("The position is $position");
      } catch (e) {
        debugPrint("The error is $e");
      }
    }
  }
}
