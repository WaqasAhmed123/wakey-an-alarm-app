import 'package:flutter/material.dart';

class SetAlarmViewModel extends ChangeNotifier {
 bool toggleAlarm = false;
  onToggle() {
    toggleAlarm = !toggleAlarm;
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
