import 'package:flutter/material.dart';

class SetAlarmViewModel extends ChangeNotifier {
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
  String? amOrPm;
  setSelectedMin({selectedMin}) {
    getSelectedMin = selectedMin;
    notifyListeners();
  }
}
