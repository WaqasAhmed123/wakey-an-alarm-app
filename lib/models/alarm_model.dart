import 'package:google_maps_flutter/google_maps_flutter.dart';

class AlarmModel {
  String? alarmTitle;
  String? alarmTime;
  List<String> alarmDays = [];
  bool? deleteAfterRinging;
  bool? vibrateWhenRinging;
  LatLng? alarmLocation;
}
