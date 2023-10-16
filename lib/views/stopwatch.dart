import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakey/widgets/stopwatch_button.dart';

class StopWatchView extends StatefulWidget {
  const StopWatchView({super.key});

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                stopwatchButton(
                    onTap: () {},
                    textColor: const Color(0xFF34344A),
                    context: context,
                    buttonTitle: "Start",
                    buttonColor: Theme.of(context).primaryColor),
                stopwatchButton(
                    onTap: () {},
                    textColor: const Color(0xFFFFFFFF),
                    context: context,
                    buttonTitle: "Lap",
                    buttonColor: const Color(0xFF39393E)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
