import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/view_models/stopwatch_viewmodel.dart';
import 'package:wakey/widgets/stopwatch_button.dart';

class StopWatchView extends StatefulWidget {
  const StopWatchView({super.key});

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  @override
  Widget build(BuildContext context) {
    StopWatchViewModel viewModel =
        Provider.of<StopWatchViewModel>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<StopWatchViewModel>(builder: (context, value, child) {
              return Text(
                value.formatTime(),
                style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF)),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                stopwatchButton(
                    onTap: () {
                      viewModel.startStopwatch();
                    },
                    textColor: const Color(0xFF34344A),
                    context: context,
                    buttonTitle: "Start",
                    buttonColor: Theme.of(context).primaryColor),
                stopwatchButton(
                    onTap: () {
                      viewModel.stopStopwatch();
                    },
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