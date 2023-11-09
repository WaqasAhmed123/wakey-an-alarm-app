import 'package:flutter/material.dart';

class SetAlarmViewModel extends ChangeNotifier {

List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
List<bool> selectedDays = [false, false, false, false, false, false, false];

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
}
