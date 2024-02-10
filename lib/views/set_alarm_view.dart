import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/utils/text_style.dart';
import 'package:wakey/views/select_location.dart';
import 'package:wakey/widgets/alarm_days.dart';
import 'package:wakey/widgets/alarm_label.dart';
import 'package:wakey/widgets/alarm_selector.dart';

import '../view_models/set_alarm_viewmodel.dart';
import '../widgets/listtile_container.dart';

class SetAlarmView extends StatefulWidget {
  const SetAlarmView({Key? key}) : super(key: key);

  @override
  State<SetAlarmView> createState() => _SetAlarmViewState();
}

class _SetAlarmViewState extends State<SetAlarmView> {
  // int selectedHour = 0;
  // int selectedMinute = 0;
  // bool isAm = true;

  @override
  Widget build(BuildContext context) {
    final setAlarmViewModel =
        Provider.of<SetAlarmViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
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
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  // color: const Color(0xFF34344A),
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: alarmTimeSelctor(
                            context: context,
                            childCount: 12,
                            columnOfScroller: 1),
                      ),
                      Expanded(
                        child: alarmTimeSelctor(
                            context: context,
                            childCount: 60,
                            columnOfScroller: 2),
                      ),
                      Expanded(
                        child: alarmTimeSelctor(
                            context: context,
                            childCount: 2,
                            columnOfScroller: 3),
                      ),
                    ],
                  ),
                ),
                listtileContainer(
                    leadingText: "Repeat",
                    onTap: () {
                      alarmDaysWidget(context: context);
                    },
                    tralingText: "Once",
                    context: context),
                listtileContainer(
                    leadingText: "Label",
                    onTap: () => alarmLabelWidget(context: context),
                    tralingText: "",
                    context: context),
                listtileContainer(
                    leadingText: "Delete after Ringing",
                    onTap: () {},
                    tralingText: "",
                    context: context,
                    isToggleButton: true),
                listtileContainer(
                    leadingText: "Vibrate when Ringing",
                    onTap: () {},
                    tralingText: "",
                    context: context,
                    isToggleButton: true,
                    vibrationWidet: true),
                InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  splashColor: Colors.transparent,
                  onTap: () async {
                    // await setAlarmViewModel.getCurrentLocation();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectLocationView()));
                  },
                  child: ListTile(
                    leading: Text(
                      "Select Location",
                      style: textStyle()["titleSmall"],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
