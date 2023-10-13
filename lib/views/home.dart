import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakey/utils/text_style.dart';
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF34344A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                // splashColor: Colors.green,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ), // <-- Icon
                    Text(
                      "Alarm",
                      style: textStyle(
                          textColor:
                              Theme.of(context).primaryColor)["titleSmall"],
                    ), // <-- Text
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.stopwatch,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ), // <-- Icon
                    Text(
                      "Stopwatch",
                      style: textStyle(
                          textColor:
                              Theme.of(context).primaryColor)["titleSmall"],
                    ), // <-- Text
                  ],
                ),
              ),
            ],
          ),
        ),
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
