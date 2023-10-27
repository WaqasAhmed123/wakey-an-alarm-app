import 'package:flutter/material.dart';

class SetAlarmViewModel extends ChangeNotifier {
  int? getSelectedHour;
  setSelectedHour({selectedHour}) {
    getSelectedHour = selectedHour;
    notifyListeners();
  }
}
