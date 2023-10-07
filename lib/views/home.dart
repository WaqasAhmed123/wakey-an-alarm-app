import 'package:flutter/material.dart';
import 'package:wakey/widgets/alarm_description.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          alarmDesctiption(
              alarmReason: "Office",
              alarmTime: "5:45",
              isDay: true,
              context: context)
        ],
      ),
    );
  }
}
