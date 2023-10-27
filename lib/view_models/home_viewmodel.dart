import 'package:flutter/material.dart';
import 'package:wakey/views/set_alarm_view.dart';

class HomeViewModel extends ChangeNotifier {
  bool toggleAlarm = false;
  onToggle() {
    toggleAlarm = !toggleAlarm;
    notifyListeners();
  }

  int selectedIndex = 0;
  onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  navigateToSetAlarm({context}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SetAlarmView()),
    );
  }
}
