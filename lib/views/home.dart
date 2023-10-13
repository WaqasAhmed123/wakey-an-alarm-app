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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                splashColor: Colors.green,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ), // <-- Icon
                    const Text("Buy"), // <-- Text
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.alarm,
                    size: 48,
                  ))
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
