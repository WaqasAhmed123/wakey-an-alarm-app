import 'dart:async';
import 'package:flutter/material.dart';

class StopWatchViewModel extends ChangeNotifier {
  final Stopwatch stopwatch = Stopwatch();
  late Timer _timer;
  bool isRunning = false;

  StopWatchViewModel() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), _updateTime);
  }

  void _updateTime(Timer timer) {
    if (isRunning) {
      notifyListeners();
    }
  }

  void startStopwatch() {
    stopwatch.start();
    isRunning = true;
    notifyListeners();
  }

  void stopStopwatch() {
    stopwatch.stop();
    isRunning = false;
    notifyListeners();
  }

  String formatTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(stopwatch.elapsed.inMinutes.remainder(60));
    String seconds = twoDigits(stopwatch.elapsed.inSeconds.remainder(60));
    String milliseconds =
        twoDigits(stopwatch.elapsed.inMilliseconds.remainder(1000) ~/ 10);
    return '$minutes:$seconds:$milliseconds';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
