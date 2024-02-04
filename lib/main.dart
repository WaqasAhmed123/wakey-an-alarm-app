import 'package:firebase_core/firebase_core.dart';
import 'package:wakey/view_models/select_location_viewmodel.dart';
import 'package:wakey/views/login_view.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/view_models/home_viewmodel.dart';
import 'package:wakey/view_models/set_alarm_viewmodel.dart';
import 'package:wakey/view_models/stopwatch_viewmodel.dart';
import 'package:wakey/views/home_view.dart';
import 'package:wakey/views/set_alarm_view.dart';
import 'package:wakey/views/stopwatch_view.dart';

import 'services/location_service.dart';
import 'views/select_location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationService.fetchCurrentLocation();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
    // Handle the error as needed
  }
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
        ChangeNotifierProvider<SelectLocationViewModel>(
            create: (context) => SelectLocationViewModel()),
        Provider(create: (context) => const SelectLocationView()),
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF0F757)),
        useMaterial3: true,
      ),
      home: const HomeView(),
      // home: const SelectLocationView(),
      // home: const LoginView(),
    );
  }
}
