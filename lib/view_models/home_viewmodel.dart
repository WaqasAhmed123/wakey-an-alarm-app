import 'package:flutter/material.dart';

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
}
