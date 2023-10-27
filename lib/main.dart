import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/utils/text_style.dart';
import 'package:wakey/view_models/home_viewmodel.dart';
import 'package:wakey/view_models/set_alarm_viewmodel.dart';
import 'package:wakey/view_models/stopwatch_viewmodel.dart';
import 'package:wakey/views/home_view.dart';
import 'package:wakey/views/set_alarm_view.dart';
import 'package:wakey/views/stopwatch_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
            create: (context) => HomeViewModel()),
        Provider(create: (context) => const HomeView()),
        ChangeNotifierProvider<StopWatchViewModel>(
            create: (context) => StopWatchViewModel()),
        Provider(create: (context) => const StopWatchView()),
        ChangeNotifierProvider<SetAlarmViewModel>(
            create: (context) => SetAlarmViewModel()),
        Provider(create: (context) => const SetAlarmView()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFF0F757),
        primaryColorDark: const Color(0xFF34344A),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
