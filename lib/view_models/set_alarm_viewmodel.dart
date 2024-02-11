import 'package:flutter/material.dart';

class SetAlarmViewModel extends ChangeNotifier {
  TextEditingController alarmLabel = TextEditingController();

  // Map<String, dynamic> alarmDetails = {};
  Map<String, bool> alarmDays = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false
  };
  // List<bool> selectedDays = [false, false, false, false, false, false, false];
  setAlarmDays({index, value}) {
    alarmDays[index] = value!;
    notifyListeners();
  }

  bool vibrate = false;
  setVibration() {
    vibrate = !vibrate;
    notifyListeners();
  }

  bool deleteAlarm = false;
  setDeletion() {
    deleteAlarm = !deleteAlarm;
    notifyListeners();
  }

  int? getSelectedHour;
  setSelectedHour({selectedHour}) {
    getSelectedHour = selectedHour;
    notifyListeners();
  }

  int? getSelectedMin;
  setSelectedMin({selectedMin}) {
    getSelectedMin = selectedMin;
    notifyListeners();
  }

  String? getSelectedAmOrPm;
  setSelectedAmOrPm({selectedAmOrPm}) {
    getSelectedAmOrPm = selectedAmOrPm;
    notifyListeners();
  }

  // _requestLocationPermission() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return false;
  //   }

  //   return permission == LocationPermission.always ||
  //       permission == LocationPermission.whileInUse;
  // }

  // // getCurrentLocation() {
  // //   return {"latitude": currentLocationLat, "longitude": currentLocationLng};
  // //   notifyListeners();
  // // }

  // late double currentLocationLat;
  // late double currentLocationLng;

  // getCurrentLocation() async {
  //   bool locationGranted = await _requestLocationPermission();

  //   if (locationGranted) {
  //     try {
  //       Position position = await Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.high);
  //       currentLocationLat = position.latitude;
  //       currentLocationLng = position.longitude;
  //       notifyListeners();
  //       // currentLocation = LatLng(
  //       //   position.latitude,
  //       //   position.longitude,
  //       // );

  //       // mapController?.animateCamera(CameraUpdate.newLatLng(currentLocation));
  //       // UserModel.currentLocation = currentLocation;
  //       debugPrint("$position");
  //       return ("The position is $position");
  //     } catch (e) {
  //       debugPrint("The error is $e");
  //     }
  //   }
  // }
}
