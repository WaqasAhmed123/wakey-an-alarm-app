import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class StopWatchViewModel extends ChangeNotifier {
  final Stopwatch stopwatch = Stopwatch();
  late Timer _timer;
  final player = AudioPlayer();

  bool isRunning = false;

  StopWatchViewModel() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), _updateTime);
  }

  void _updateTime(Timer timer) {
    if (isRunning) {
      notifyListeners();
    }
  }

  void cancelStopwatch() {
    stopwatch.stop();
    player.stop();

    stopwatch.reset();
    if (_timer.isActive) {
      _timer.cancel(); // Cancel the timer if it's active
    }
    isRunning = false;
    notifyListeners();
  }

  void startStopwatch() async {
    stopwatch.start();
    isRunning = true;
    if (!_timer.isActive) {
      _timer = Timer.periodic(const Duration(milliseconds: 100), _updateTime);
    }
    await playAudio();
    // await player.play(AssetSource(
    //   'audios/timer_sound.mp3',
    // ));
    // player.onPlayerComplete.listen((event) {
    //   player.play(
    //     AssetSource('audios/timer_sound.mp3'),
    //   );
    // });
    notifyListeners();
  }

  void pauseStopwatch() async {
    debugPrint("before $isRunning");
    isRunning = !isRunning;
    debugPrint("after $isRunning");

    if (!isRunning) {
      stopwatch.stop();
      player.pause();
    } else {
      stopwatch.start();
      await playAudio();
    }

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

  playAudio() async {
    await player.play(AssetSource(
      'audios/timer_sound.mp3',
    ));
    player.onPlayerComplete.listen((event) {
      player.play(
        AssetSource('audios/timer_sound.mp3'),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
