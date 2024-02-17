import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wakey/models/alarm_model.dart';

import '../services/database_service.dart';

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

  insertAlarm(){
    AlarmModel alarmModel=AlarmModel(alarmDays: jsonEncode(alarmDays))
    DataBase.instance.insertAlarm(alarm)
  }
}
