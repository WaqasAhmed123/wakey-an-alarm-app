import 'package:flutter/material.dart';

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
                  child: ListView.builder(
                    itemCount: days.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(days[index]),
                        // leading: const Icon(Icons.calendar_today),
                        trailing: Checkbox(
                          value: selectedDays[index],
                          onChanged: (value) {
                            // setState(() {
                            selectedDays[index] = value!;
                            // });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            const Divider(thickness: 1, color: Colors.black),
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
  