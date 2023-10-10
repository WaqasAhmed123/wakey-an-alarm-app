import 'package:flutter/material.dart';
import 'package:wakey/widgets/alarm_description.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              alarmDescription(
                alarmReason: "Office",
                alarmTime: "5:45",
                isDay: true,
                context: context,
                alarmDays: [true, false, true, false, false, false, false],
              )
            ],
          ),
        ),
      ),
    );
  }
}
