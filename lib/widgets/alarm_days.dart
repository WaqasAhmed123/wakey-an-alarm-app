import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakey/view_models/set_alarm_viewmodel.dart';

List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
List<bool> selectedDays = [false, false, false, false, false, false, false];
alarmDays({context}) {
  final setAlarmViewModel =
      Provider.of<SetAlarmViewModel>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Repeat'),
          content: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: Column(
              children: [
                Expanded(
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return Consumer<SetAlarmViewModel>(
                          builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: value.days.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(value.days[index]),
                              // leading: const Icon(Icons.calendar_today),
                              trailing: Checkbox(
                                value: value.selectedDays[index],
                                onChanged: (value) {
                                  // setState(() {
                                  setAlarmViewModel.selectedDays[index] =
                                      value!;
                                  // });
                                },
                              ),
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            const Divider(thickness: 1, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Done'),
                  onPressed: () {
                    // Perform the desired action with selectedDays
                    print('Selected Days: $selectedDays');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
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
  