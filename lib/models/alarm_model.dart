// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class AlarmModel {
//   String? alarmTitle;
//   String? alarmTime;
//   List<String> alarmDays = [];
//   bool? deleteAfterRinging;
//   bool? vibrateWhenRinging;
//   LatLng? alarmLocation;
// }

import 'package:google_maps_flutter/google_maps_flutter.dart';

class AlarmModel {
  int? id;
  String? alarmTitle;
  String? alarmTime;
  List<String> alarmDays = [];
  bool? deleteAfterRinging;
  bool? vibrateWhenRinging;
  LatLng? alarmLocation;

  // Constructor
  AlarmModel({
    this.id,
    this.alarmTitle,
    this.alarmTime,
    required this.alarmDays,
    this.deleteAfterRinging,
    this.vibrateWhenRinging,
    this.alarmLocation,
  });

  // Convert AlarmModel object to a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alarmTitle': alarmTitle,
      'alarmTime': alarmTime,
      'alarmDays':
          alarmDays.join(','), // Convert list to comma-separated string
      'deleteAfterRinging': deleteAfterRinging,
      'vibrateWhenRinging': vibrateWhenRinging,
      // 'deleteAfterRinging': deleteAfterRinging ? 1 : 0,
      // 'vibrateWhenRinging': vibrateWhenRinging ? 1 : 0,
      'alarmLocationLat': alarmLocation?.latitude,
      'alarmLocationLng': alarmLocation?.longitude,
    };
  }

  // Factory method to create an AlarmModel object from a Map object
  factory AlarmModel.fromMap(Map<String, dynamic> map) {
    return AlarmModel(
      id: map['id'],
      alarmTitle: map['alarmTitle'],
      alarmTime: map['alarmTime'],
      alarmDays: (map['alarmDays'] as String)
          .split(','), // Convert comma-separated string to a list
      deleteAfterRinging: map['deleteAfterRinging'] == 1 ? true : false,
      vibrateWhenRinging: map['vibrateWhenRinging'] == 1 ? true : false,
      alarmLocation:
          map['alarmLocationLat'] != null && map['alarmLocationLng'] != null
              ? LatLng(map['alarmLocationLat'], map['alarmLocationLng'])
              : null,
    );
  }
}

