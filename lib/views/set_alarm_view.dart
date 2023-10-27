import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakey/utils/text_style.dart';
import 'package:wakey/widgets/alarm_selector.dart';

class SetAlarmView extends StatefulWidget {
  const SetAlarmView({Key? key}) : super(key: key);

  @override
  State<SetAlarmView> createState() => _SetAlarmViewState();
}

class _SetAlarmViewState extends State<SetAlarmView> {
  int selectedHour = 0;
  int selectedMinute = 0;
  bool isAm = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
                Text(
                  "Add Alarm",
                  style: textStyle()['titleMedium'],
                ),
                IconButton(
                    onPressed: () {
                      // Handle the selected alarm time (selectedHour, selectedMinute, isAm)
                      // Save the selected time to your alarm data or perform other actions.
                    },
                    icon: const Icon(Icons.check, color: Colors.white)),
              ],
            ),
            Container(
              // color: const Color(0xFF34344A),
              color: Theme.of(context).primaryColorDark,
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: Row(
                children: [
                  Expanded(
                    child: alarmTimeSelctor(context: context, childCount: 12),
                  ),
                  Expanded(
                    child: alarmTimeSelctor(context: context, childCount: 60),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
