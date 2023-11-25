import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/set_alarm_viewmodel.dart';

alarmLabelWidget({context}) {
  final setAlarmViewModel =
      Provider.of<SetAlarmViewModel>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Label'),
            content: SizedBox(
              // width: double.maxFinite,
              // height: MediaQuery.sizeOf(context).height * 0.35,
              child: TextFormField(
                controller: setAlarmViewModel.alarmLabel,
                
              ),
            ),
            actions: [
              // const Divider(thickness: 1, color: Colors.black),
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
