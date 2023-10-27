import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/set_alarm_viewmodel.dart';

alarmTimeSelctor({
  context,
  childCount,
}) {
  final setAlarmViewModel =
      Provider.of<SetAlarmViewModel>(context, listen: false);

  return ListWheelScrollView.useDelegate(
      physics: const FixedExtentScrollPhysics(),
      itemExtent: 40,
      onSelectedItemChanged: (index) {
        setAlarmViewModel.setSelectedHour(selectedHour: index + 1);
        print(setAlarmViewModel.getSelectedHour);
        //  = index + 1;
      },
      childDelegate: ListWheelChildBuilderDelegate(
          childCount: childCount,
          builder: (context, index) {
            int displayedValue = index + 1;
            return Center(
              child: Consumer<SetAlarmViewModel>(
                builder: (context, viewModel, child) {
                  return Text(
                    displayedValue < 10
                        ? '0$displayedValue'
                        : '$displayedValue',
                    style: TextStyle(
                      fontSize: 22,
                      color: displayedValue == viewModel.getSelectedHour
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  );
                },
              ),
            );
          }));
}
