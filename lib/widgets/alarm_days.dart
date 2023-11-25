import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/view_models/set_alarm_viewmodel.dart';

// List<String> days = [
//   'Monday',
//   'Tuesday',
//   'Wednesday',
//   'Thursday',
//   'Friday',
//   'Saturday',
//   'Sunday'
// ];
// List<bool> selectedDays = [false, false, false, false, false, false, false];
alarmDaysWidget({context}) {
  final setAlarmViewModel =
      Provider.of<SetAlarmViewModel>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Repeat'),
            content: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.sizeOf(context).height * 0.35,
              child: Column(
                children: [
                  Expanded(
                    child: Consumer<SetAlarmViewModel>(
                        builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.alarmDays.length,
                        itemBuilder: (BuildContext context, int index) {
                          String day = value.alarmDays.keys.elementAt(index);
                          return ListTile(
                            title: Text(value.alarmDays.keys.elementAt(index)),
                            // leading: const Icon(Icons.calendar_today),
                            trailing: Checkbox(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Theme.of(context).primaryColorDark;
                                }
                                return null; // Use null to use the default color when not selected
                              }),
                              value: value.alarmDays.values.elementAt(index),
                              onChanged: (value) {
                                setState(() {
                                  // setAlarmViewModel.alarmDays.keys.elementAt(index) =
                                  //     value!;
                                  setAlarmViewModel.alarmDays[day] = value!;
                                });
                              },
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
            actions: [
              const Divider(thickness: 1, color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Done',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      // Perform the desired action with selectedDays
                      // print('Selected Days: ${setAlarmViewModel.selectedDays}');
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        });
      });
}

// void showDialogWithScrollableItems(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return RepeatDialog();
//     },
//   );
// }
  