import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool toggleAlarm = false;
  onToggle() {
    toggleAlarm = !toggleAlarm;
    notifyListeners();
  }
}
