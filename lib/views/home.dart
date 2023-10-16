import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/widgets/alarm_description.dart';

import '../view_models/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xFF34344A),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.alarm),
                  label: 'Alarm',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.stopwatch),
                  label: 'Stopwatch',
                ),
              ],
              currentIndex: homeViewModel.selectedIndex,
              selectedItemColor: Theme.of(context).primaryColor,
              onTap: (index) => homeViewModel.onItemTapped(index),
            ),
          ),
          body: homeViewModel.selectedIndex == 0
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      alarmDescription(
                        alarmReason: "Office",
                        alarmTime: "5:45",
                        isDay: true,
                        context: context,
                        alarmDays: [
                          true,
                          false,
                          true,
                          false,
                          false,
                          false,
                          false
                        ],
                      )
                    ],
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Your stopwatch widget content goes here
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
